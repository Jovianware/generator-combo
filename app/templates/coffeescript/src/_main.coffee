define [
  'cs!<%= _.classify(gameName) %>'
], (
  <%= _.classify(gameName) %>
) ->
  getParameterByName = (name) ->
    name = name.replace(/[\[]/, '\\\[').replace(/[\]]/, '\\\]')
    regex = new RegExp('[\\?&]' + name + '=([^&#]*)')
    results = regex.exec(location.search)
    return if results == null then '' else decodeURIComponent(results[1].replace(/\+/g, ' '))

  return ->
    app = new <%= _.classify(gameName) %>
      container: 'container'
      forceCanvas: parseInt getParameterByName('forceCanvas')

    app.run()

    pleasewait = document.getElementById 'pleasewait'
    pleasewait.style.display = 'none'

    container = document.getElementById 'container'
    container.style.display = 'inherit'
