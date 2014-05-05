var cg = require('cg'),
    <%= name %>;

<%= name %> = <%= parentClass %>.extend('<%= name %>', {
  init: function () {
    // Called when the scene is first created.
  },

  preloadComplete: function () {
    // Called once everything in this.assets has been loaded.
  },

  update: function () {
    // Called once every frame.
  }
});

module.exports = <%= name %>;
