define([
  '<%= _.classify(gameName) %>'
], function (
  <%= _.classify(gameName) %>
) {
  var getParameterByName = function (name) {
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

  return function () {
    var game, pleasewait, container;

    game = new <%= _.classify(gameName) %>({
      container: 'container',
      forceCanvas: parseInt(getParameterByName('forceCanvas'))
    });

    window.game = game;

    game.run();

    pleasewait = document.getElementById('pleasewait');
    pleasewait.style.display = 'none';

    container = document.getElementById('container');
    container.style.display = 'inherit';
  };
});
