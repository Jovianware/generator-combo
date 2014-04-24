cg = require 'cg'<% if (baseType) { %>
Physical = require 'plugins/physics/Physical'
Interactive = require 'plugins/ui/Interactive'<% } else { %>
<%= parentClass %> = require '<%= parentClass %>'<% } %>

class <%= name %> extends <%= parentClass %><% if (baseType) { %>
  @plugin Physical, Interactive
  <% } %>
  constructor: (properties) ->
    super properties

  update: ->
    super

module.exports = <%= name %>
