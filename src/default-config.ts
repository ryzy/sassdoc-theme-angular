export const config = {
  display: {
    annotations: {
      function: [ 'description', 'parameter', 'return', 'example', 'throw', 'require', 'usedby', 'since', 'see', 'todo', 'link', 'author' ],
      mixin: [ 'description', 'parameter', 'content', 'example', 'output', 'throw', 'require', 'usedby', 'since', 'see', 'todo', 'link', 'author' ],
      placeholder: [ 'description', 'example', 'throw', 'require', 'usedby', 'since', 'see', 'todo', 'link', 'author' ],
      variable: [ 'description', 'type', 'property', 'require', 'example', 'usedby', 'since', 'see', 'todo', 'link', 'author' ],
      css: [ 'description', 'example', 'since', 'see', 'todo', 'link', 'author' ],
    },
    access: [ 'public', 'private' ],
    alias: false,
    watermark: true,
  },
  groups: {
    undefined: 'General',
  },
};
