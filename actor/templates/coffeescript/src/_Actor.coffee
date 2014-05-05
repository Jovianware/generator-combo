cg = require 'cg'<% if (baseType) { %>
Physical = require 'plugins/physics/Physical'
Interactive = require 'plugins/ui/Interactive'<% } else { %>
<%= parentClass %> = require '<%= parentClass %>'<% } %>

class <%= name %> extends <%= parentClass %><% if (baseType) { %>
  @plugin Physical, Interactive
  <% } %>
  init: ->
    # Called when the actor is first created.

  update: ->
    # Called once every frame.

module.exports = <%= name %>
