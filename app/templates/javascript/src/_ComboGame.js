define([
  'cs!combo/cg'
], function (
  cg
) {

  <%= _.classify(gameName) %> = cg.App.extend({
    name: '<%= gameName %>',
    init: function () {
      this.super();

      cg.log('Combo game initialized!');
    }
  });

  return <%= _.classify(gameName) %>;
});
