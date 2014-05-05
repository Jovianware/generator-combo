cg = require 'cg'

class <%= _.classify(gameName) %> extends cg.Scene
  init: ->
    @logo = @addChild new cg.Actor
      texture: 'logo'
      anchorX: 0.5
      anchorY: 0.5
      x: cg.width/2
      y: cg.height/2

  update: ->
    @logo.rotation += 0.02

module.exports = <%= _.classify(gameName) %>
