define([
  'cs!combo/cg'
], function (
  cg
) {

  var <%= _.classify(gameName) %> = function (App, forceCanvas) {
    _<%= _.classify(gameName) %> = App.extend({
      forceCanvas: !!forceCanvas,
      init: function () {
        this.super();

        cg.log('Combo game initialized!');
      }
    });

    return _<%= _.classify(gameName) %>;
  };

  return <%= _.classify(gameName) %>;
});
