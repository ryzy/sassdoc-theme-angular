import def from '../default'
import { Promise } from 'es6-promise'
import es6denodeify from 'es6-denodeify'
import extend from 'extend'
import fs from 'fs-extra'
import path from 'path'
import sassdocExtras from 'sassdoc-extras'
import swig from './swig'

const denodeify = es6denodeify(Promise);
const renderFile = denodeify(swig.renderFile);
const readFile = denodeify(fs.readFile);
const writeFile = denodeify(fs.writeFile);

const applyDefaults = ctx =>
  extend({}, def, ctx, {
    groups: extend(def.groups, ctx.groups),
    display: extend(def.display, ctx.display)
  });

/**
 * Escape chars which needs to be escaped in Angular's templates (e.g. curly braces characters)
 */
function ngSafeFilter(input, idx) {
  // console.log('ngSafe', { input, idx });
  return input.replace(/{/g, "&#123;")
    .replace(/}/g, "&#125;")
    .replace(/\|/g, "&#124;")
    ;
}
ngSafeFilter.safe = true;
swig.setFilter('ngSafe', ngSafeFilter);

// Main theme function, to export as default
function theme(dest, ctx) {
  ctx = applyDefaults(ctx);
  sassdocExtras(ctx,
    'description',
    'markdown',
    'display',
    'groupName',
    'shortcutIcon',
    'sort',
    'resolveVariables'
  );
  ctx.data.byGroupAndType = sassdocExtras.byGroupAndType(ctx.data);

  const index = path.resolve(__dirname, '../views/documentation/index.html.swig');
  return renderFile(index, ctx)
    .then(html => writeFile(path.resolve(dest, 'index.html'), html));
}


export default theme;
