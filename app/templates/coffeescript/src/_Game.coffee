define [
  'cs!combo/cg'
], (
  cg
) ->

  <%= _.classify(gameName) %> = (App, forceCanvas=false) ->
    class _<%= _.classify(gameName) %> extends App
      forceCanvas: forceCanvas
      init: ->
        super

        cg.log 'Combo game initialized!'

    return _<%= _.classify(gameName) %>

  return <%= _.classify(gameName) %>
