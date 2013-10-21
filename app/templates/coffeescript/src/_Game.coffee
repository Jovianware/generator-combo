define [
  'cs!combo/cg'
], (
  cg
) ->

  class <%= _.classify(gameName) %> extends cg.App
    init: ->
      super

      cg.log 'Combo game initialized!'

  return <%= _.classify(gameName) %>
