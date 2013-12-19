define([
  'cs!combo/cg'
], function (
  cg
) {

  var <%= name %> = <%= parentClass %>.extend('<%= name %>', {
    constructor: function () {
      this.super.apply(this, arguments);
    },
  });

  return <%= name %>;
});
