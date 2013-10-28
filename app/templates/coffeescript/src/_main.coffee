define [
  'cs!combo/cg'
  'cs!<%= _.classify(gameName) %>'
], (
  cg
  <%= _.classify(gameName) %>
) ->
  return ->
    cg.init
      name: '<%= gameName %>'
      container: 'container'
      forceCanvas: !!parseInt(cg.env.getParameterByName('forceCanvas'))
      backgroundColor: 0xFFFFFF

    window.app = cg.stage.addChild new <%= _.classify(gameName) %>

    pleasewait = document.getElementById 'pleasewait'
    pleasewait.style.display = 'none'

    container = document.getElementById 'container'
    container.style.display = 'inherit'
