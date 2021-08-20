//= link_tree ../images
//= link_directory ../stylesheets .css
build: {
  babel: {
    plugins: [['@babel/plugin-proposal-private-methods', { loose: true }]],
  },
},