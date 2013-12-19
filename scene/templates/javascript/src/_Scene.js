define([
  'cs!combo/cg'
], function (
  cg
) {

  var <%= name %> = <%= parentClass %>.extend('<%= name %>', {
    constructor: function (properties) {
      this.super(properties);
    },

    update: function () {
      this.super();
    }
  });

  return <%= name %>;
});
