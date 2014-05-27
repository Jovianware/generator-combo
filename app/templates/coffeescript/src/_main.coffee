cg = require 'cg'
require 'index'

UI = require 'plugins/ui/UI'
Physics = require 'plugins/physics/Physics'
<%= _.classify(gameName) %> = require '<%= _.classify(gameName) %>'
assets = require 'assets.json'

module.exports = ->
  # App-wide plugins need to be loaded before `cg.init` is called:
  cg.plugin UI
  cg.plugin Physics

  # This will set up graphics, sound, input, data, plugins, and start our game loop:
  cg.init
    name: '<%= gameName %>'
    width: 1280
    height: 720
    backgroundColor: 0x222222

  loadingScreen = cg.stage.addChild new cg.extras.LoadingScreen
  loadingScreen.begin()

  cg.assets.preload assets,
    error: (src) ->
      cg.error 'Failed to load asset ' + src
    progress: (src, data, loaded, count) ->
      cg.log "Loaded '#{src}'"
      loadingScreen.setProgress loaded/count
    complete: ->
      loadingScreen.complete().then ->
        loadingScreen.destroy()
        cg.stage.addChild new <%= _.classify(gameName) %>
          id: 'main'

        cg.stage.addChild new cg.extras.PauseScreen
          id: 'pauseScreen'

        cg('#pauseScreen').hide()

        pause = ->
          cg.sound.pauseAll()
          cg('#main').pause()
          cg('#pauseScreen').show()

        cg.on 'blur', pause

        cg('#pauseScreen').on 'dismiss', ->
          cg('#main').resume()
          cg.sound.resumeAll()

        pause()
  # Hide the pre-pre loading "Please Wait..." message:
  document.getElementById('pleasewait').style.display = 'none'

  # Show our game container:
  document.getElementById('combo-game').style.display = 'inherit'

module.exports()
