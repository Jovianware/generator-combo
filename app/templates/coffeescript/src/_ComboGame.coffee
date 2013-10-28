define [
  'cs!combo/cg'
], (
  cg
) ->

  class <%= _.classify(gameName) %> extends cg.Scene
    assets:
      textures:
        logo: 'assets/logo.png'
    constructor: ->
      super
      cg.log 'Combo game initialized!'

      @loadingScreen = @addChild new cg.extras.LoadingScreen
      @loadingScreen.begin()

    preloadProgress: (src, data, loaded, count) ->
      super
      @loadingScreen.setProgress loaded/count

    preloadComplete: ->
      super
      @loadingScreen.complete().then =>
        @loadingScreen.destroy()
        @createLogo()

    createLogo: ->
      @logo = @addChild new cg.SpriteActor
        texture: 'logo'
        anchorX: 0.5
        anchorY: 0.5
        x: cg.width/2
        y: cg.height/2

      ar = @logo.width/@logo.height
      @logo.scale = 0

      @logo.tween
        values: width: cg.width
        easeFunc: 'elastic.out'

      @logo.tween
        delay: 50
        values: height: cg.width / ar
        easeFunc: 'elastic.out'

  return <%= _.classify(gameName) %>
