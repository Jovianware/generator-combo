define([
  'cs!combo/cg'
], function (
  cg
) {
  var <%= _.classify(gameName) %> = cg.Scene.extend('<%= _.classify(gameName) %>', {
    assets: {
      textures: {
        logo: 'assets/logo.png'
      }
    },

    constructor: function () {
      this.super.apply(this, arguments);
      cg.log('Combo game initialized!');

      this.loadingScreen = this.addChild(new cg.extras.LoadingScreen);
      this.loadingScreen.begin();
    },

    preloadProgress: function (src, data, loaded, count) {
      this.super(src, data, loaded, count);
      this.loadingScreen.setProgress(loaded/count);
    },

    preloadComplete: function () {
      this.super();
      var that = this;
      this.loadingScreen.complete().then(function () {
        that.loadingScreen.destroy();
        that.createLogo();
      });
    },

    createLogo: function () {
      this.logo = this.addChild(new cg.SpriteActor({
        texture: 'logo',
        anchorX: 0.5,
        anchorY: 0.5,
        x: cg.width/2,
        y: cg.height/2
      }));

      var ar = this.logo.width / this.logo.height;
      this.logo.scale = 0;

      this.logo.tween({
        values: { width: cg.width },
        easeFunc: 'elastic.out'
      });

      this.logo.tween({
        delay: 50,
        values: { height: cg.width / ar },
        easeFunc: 'elastic.out'
      });
    }
  });

  return <%= _.classify(gameName) %>;
});
