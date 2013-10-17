define([
  'cs!combo/index',
  'cs!combo/web/WebApp',
  '<%= _.classify(gameName) %>'
], function (
  combo,
  WebApp,
  <%= _.classify(gameName) %>
) {

  return function () {
    var container, forceCanvas, game, getParameterByName, pleasewait;

    combo.init();

    getParameterByName = function (name) {
      var regex, results;
      name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
      regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
      results = regex.exec(location.search);
      if (results === null) {
        return "";
      } else {
        return decodeURIComponent(results[1].replace(/\+/g, " "));
      }
    };

    forceCanvas = parseInt(getParameterByName('forceCanvas'));
    
    game = new (<%= _.classify(gameName) %>(WebApp, forceCanvas))('container');
    
    window.game = game;
    
    game.run();
    
    pleasewait = document.getElementById('pleasewait');
    pleasewait.style.display = 'none';
    
    container = document.getElementById('container');
    container.style.display = 'inherit';
  };
});
