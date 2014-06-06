cg = require 'combo'
extras = require 'extras'
UI = require 'plugins/ui/UI'
Physics = require 'plugins/physics/Physics'
<%= _.classify(gameName) %> = require '<%= _.classify(gameName) %>'
assets = require 'assets.json'

# App-wide plugins need to be loaded before `cg.init` is called:
cg.plugin UI
cg.plugin Physics

# This will set up graphics, sound, input, data, plugins, and start our game loop:
cg.init
  name: '<%= gameName %>'
  width: 1280
  height: 720
  backgroundColor: 0x222222

loadingScreen = cg.stage.addChild new extras.LoadingScreen
loadingScreen.begin()

cg.load assets, (src, data, loaded, count) ->
    cg.log "Loaded '#{src}'"
    loadingScreen.setProgress loaded/count
.then ->
  loadingScreen.complete()
.then ->
  loadingScreen.destroy()
  cg.stage.addChild new <%= _.classify(gameName) %>
    id: 'main'

  pauseScreen = cg.stage.addChild new extras.PauseScreen

  pauseScreen.hide()

  pause = ->
    cg.sound.pauseAll()
    cg('#main').pause()
    pauseScreen.show()

  cg.on 'blur', pause

  pauseScreen.on 'dismiss', ->
    cg('#main').resume()
    cg.sound.resumeAll()

  pause()

# Hide the pre-pre loading "Please Wait..." message:
document.getElementById('pleasewait').style.display = 'none'

# Show our game container:
document.getElementById('combo-game').style.display = 'inherit'
