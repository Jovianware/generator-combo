var cg = require('cg')<% if (baseType) { %>,
    Physical = require('plugins/physics/Physical'),
    Interactive = require('plugins/ui/Interactive')<% } else { %>,
    <%= parentClass %> = require('<%= parentClass %>')<% } %>,
    <%= name %>;

<%= name %> = <%= parentClass %>.extend('<%= name %>', {
  init: function () {
    // Called when the actor is first created.
  },

  update: function () {
    // Called once every frame.
  }
});<% if (baseType) { %>

<%= name %>.plugin(Physical, Interactive);<% } %>

module.exports = <%= name %>;
