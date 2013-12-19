define [
  'cs!combo/cg'
], (
  cg
) ->

  class <%= name %> extends <%= parentClass %>
    constructor: ->
      super

    update: ->
      super

  return <%= name %>
