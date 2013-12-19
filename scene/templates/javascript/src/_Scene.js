define([
  'cs!combo/cg'
], function (
  cg
) {

  var <%= name %> = <%= parentClass %>.extend('<%= name %>', {
    constructor: function (properties) {
      this._super(properties);
    },

    update: function () {
      this._super();
    }
  });

  return <%= name %>;
});
