cg = require 'cg'<% if (baseType) { %>
Physical = require 'plugins/physics/Physical'
Interactive = require 'plugins/ui/Interactive'<% } else { %>
<%= parentClass %> = require '<%= parentClass %>'<% } %>

class <%= name %> extends <%= parentClass %><% if (baseType) { %>
  @plugin Physical, Interactive<% } %>

module.exports = <%= name %>
