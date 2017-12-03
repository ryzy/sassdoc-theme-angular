import { Promise } from 'es6-promise';
import * as es6denodeify from 'es6-denodeify';
import * as extend from 'extend';
import * as fs from 'fs-extra';
import * as path from 'path';
import * as sassdocExtras from 'sassdoc-extras';
import { swig } from './swig';
import { config as defaultConfig } from './default-config';

const denodeify  = es6denodeify(Promise);
const renderFile = denodeify(swig.renderFile);
const readFile   = denodeify(fs.readFile);
const writeFile  = denodeify(fs.writeFile);

const applyDefaults = ctx =>
  extend({}, defaultConfig, ctx, {
    groups: extend(defaultConfig.groups, ctx.groups),
    display: extend(defaultConfig.display, ctx.display),
  });

/**
 * Escape chars which needs to be escaped in Angular's templates (e.g. curly braces characters)
 */
function ngSafeFilter(input, idx) {
  // console.log('ngSafe', { input, idx });
  return input.replace(/{/g, '&#123;')
    .replace(/}/g, '&#125;')
    .replace(/\|/g, '&#124;')
    ;
}

(ngSafeFilter as any).safe = true;
swig.setFilter('ngSafe', ngSafeFilter);

// Main theme function, to export as default
export function theme(dest, ctx) {
  ctx = applyDefaults(ctx);
  sassdocExtras(ctx,
    'description',
    'markdown',
    'display',
    'groupName',
    'shortcutIcon',
    'sort',
    'resolveVariables',
  );

  ctx.data.byGroupAndType = sassdocExtras.byGroupAndType(ctx.data);

  // Override `byGroupAndType` order inside each group, so we start from css, placeholders and mixins, then the rest.
  Object.keys(ctx.data.byGroupAndType).forEach(groupName => {
    // Make sure items in each section are ordered according to these:
    ctx.data.byGroupAndType[ groupName ] = Object.assign({
      css: [],
      placeholder: [],
      mixin: [],
    }, ctx.data.byGroupAndType[ groupName ]);
  });

  // Build `ctx` divided by each `@group` - so we can render them separately,
  // each `@group` will go into its dedicated .html file.
  const ctxByGroup = {
    // One custom group, with description only (so: no data to render)
    docs: Object.assign({}, ctx, { data: [] }),
  };
  Object.keys(ctx.groups).forEach(groupName => {
    // Prepare data with items only from the specific group
    const data = ctx.data.filter(item => {
      // console.log('ITEM', item);
      return item.group && item.group.indexOf(groupName) > -1;
    });

    if (!data.length) {
      return; // no items in this group to render? exit...
    }

    // Also, data.byGroupAndType needs to be updated accordingly
    data.byGroupAndType              = {};
    data.byGroupAndType[ groupName ] = ctx.data.byGroupAndType[ groupName ];

    ctxByGroup[ groupName ] = Object.assign({}, ctx, { data, description: '' });
  });

  const index      = path.resolve(__dirname, '../views/documentation/index.html.swig');
  const buildSteps = Object.keys(ctxByGroup)
    .map(groupName => renderFile(index, ctxByGroup[ groupName ])
      .then(content => writeFile(path.resolve(dest, `${groupName}.html`), content)),
    );

  return Promise.all(buildSteps);
}

//
// Add custom annotations
//
(theme as any).annotations = [
  () => ({
    name: 'exampleFile',
    parse: function (filePath) {
      return { filePath };
    },
    resolve: function (data) {
      Object.entries(data)
        .filter(([ key, item ]) => item.exampleFile && item.exampleFile.length)
        .forEach(([ key, item ]) => {
          const examples = item.example || [];

          // TODO: support multiple instances of it?
          const exampleFilePath = item.exampleFile[ 0 ].filePath;

          readFile(exampleFilePath).then(
            fileContent => {
              examples.push({
                type: 'markup',
                code: fileContent.toString(),
              });
            },
            e => console.error(e),
          );

          item.example = examples;
        });
    },
  }),
];

// export = theme;
