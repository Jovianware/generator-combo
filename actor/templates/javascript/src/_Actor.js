define([
  'cs!combo/cg',<% if (baseType) { %>
  'cs!combo/plugins/physics/Physical',
  'cs!combo/plugins/ui/Interactive'<% } else { %>
  '<%= parentClass %>'<% } %>
], function (
  cg,<% if (baseType) { %>
  Physical,
  Interactive<% } else { %>
  <%= parentClass %><% } %>
) {

  var <%= name %> = <%= parentClass %>.extend('<%= name %>', {
    constructor: function (properties) {
      this._super(properties);
    },

    update: function () {
      this._super();
    }
  });<% if (baseType) { %>

  <%= name %>.plugin(Physical, Interactive);
<% } %>

  return <%= name %>;
});
