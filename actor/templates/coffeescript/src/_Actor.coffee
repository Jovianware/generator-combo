define [
  'cs!combo/cg'<% if (baseType) { %>
  'cs!combo/plugins/physics/Physical'
  'cs!combo/plugins/ui/Interactive'<% } else { %>
  '<%= parentClass %>'<% } %>
], (
  cg<% if (baseType) { %>
  Physical
  Interactive<% } else { %>
  <%= parentClass %><% } %>
) ->

  class <%= name %> extends <%= parentClass %><% if (baseType) { %>
    @plugin Physical, Interactive<% } %>
    constructor: ->
      super

    update: ->
      super

  return <%= name %>
