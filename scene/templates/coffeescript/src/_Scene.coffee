cg = require 'cg'

class <%= name %> extends <%= parentClass %>
  init: ->
    # Called when the scene is first created.

  preloadComplete: ->
    # Called once everything in @assets has been loaded.

  update: ->
    # Called once every frame.

module.exports = <%= name %>
