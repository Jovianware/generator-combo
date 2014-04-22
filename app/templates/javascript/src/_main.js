var cg = require('cg'),
    combo = require('index'),
    UI = require('plugins/ui/UI'),
    Physics = require('plugins/physics/Physics'),
    <%= _.classify(gameName) %> = require('<%= _.classify(gameName) %>');

module.exports = function() {
  var loadingScreen;

  // App-wide plugins need to be loaded before `cg.init` is called:
  cg.plugin(UI);
  cg.plugin(Physics);

  // This will set up graphics, sound, input, data, plugins, and start our game loop:
  cg.init({
    name: '<%= gameName %>',
    width: 1280,
    height: 720,
    backgroundColor: 0x222222,
    forceCanvas: !!parseInt(cg.env.getParameterByName('forceCanvas'))
  });

  loadingScreen = cg.stage.addChild(new cg.extras.LoadingScreen);
  loadingScreen.begin();

  cg.assets.loadJSON('assets.json').then(function(pack) {
    cg.assets.preload(pack, {
      error: function(src) {
        cg.error('Failed to load asset ' + src);
      },
      progress: function(src, data, loaded, count) {
        cg.log("Loaded '" + src + "'");
        loadingScreen.setProgress(loaded / count);
      },
      complete: function() {
        loadingScreen.complete().then(function() {
          loadingScreen.destroy();
          cg.stage.addChild(new <%= _.classify(gameName) %>({
            id: 'main'
          }));
        });
      }
    });
  }, function(err) {
    throw new Error('Failed to load assets.json: ' + err.message);
  });

  // Hide the pre-pre loading "Please Wait..." message:
  document.getElementById('pleasewait').style.display = 'none';

  // Show our game container:
  document.getElementById('combo-game').style.display = 'inherit';
};

module.exports();
