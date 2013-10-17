define [
  'cs!combo/index'
  'cs!combo/web/WebApp'
  'cs!<%= _.classify(gameName) %>'
], (
  combo
  WebApp
  <%= _.classify(gameName) %>
) ->

  return ->
    combo.init()

    getParameterByName = (name) ->
      name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]")
      regex = new RegExp("[\\?&]" + name + "=([^&#]*)")
      results = regex.exec(location.search)
      return if results == null then "" else decodeURIComponent(results[1].replace(/\+/g, " "))

    forceCanvas = parseInt(getParameterByName('forceCanvas'))

    game = new (<%= _.classify(gameName) %>(WebApp, forceCanvas))('container')

    window.game = game

    game.run()

    pleasewait = document.getElementById 'pleasewait'
    pleasewait.style.display = 'none'

    container = document.getElementById 'container'
    container.style.display = 'inherit'
