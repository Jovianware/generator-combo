var cg = require('cg')<% if (baseType) { %>,
    Physical = require('plugins/physics/Physical'),
    Interactive = require('plugins/ui/Interactive')<% } else { %>,
    <%= parentClass %> = require('<%= parentClass %>')<% } %>,
    <%= name %>;

<%= name %> = <%= parentClass %>.extend('<%= name %>', {
  constructor: function (properties) {
    this._super(properties);
  },

  update: function () {
    this._super();
  }
});<% if (baseType) { %>

<%= name %>.plugin(Physical, Interactive);<% } %>

module.exports = <%= name %>;
