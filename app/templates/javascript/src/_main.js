define([
  'cs!combo/cg',
  '<%= _.classify(gameName) %>'
], function (
  cg,
  <%= _.classify(gameName) %>
) {

  return function () {
    var pleasewait,
        container;

    cg.init({
      name: '<%= gameName %>',
      container: 'container',
      forceCanvas: !!parseInt(cg.env.getParameterByName('forceCanvas')),
      backgroundColor: 0xFFFFFF
    });

    window.app = cg.stage.addChild(new <%= _.classify(gameName) %>);

    pleasewait = document.getElementById('pleasewait');
    pleasewait.style.display = 'none';

    container = document.getElementById('container');
    container.style.display = 'inherit';
  };

});
