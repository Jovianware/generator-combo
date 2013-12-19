define [
  'cs!combo/cg'
  'cs!combo/plugins/physics/Physical'
  'cs!combo/plugins/ui/Interactive'
], (
  cg
  Physical
  Interactive
) ->

  class <%= name %> extends <%= parentClass %>
    @plugin Physical, Interactive
    constructor: ->
      super

    update: ->
      super

  return <%= name %>
