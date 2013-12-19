define([
  'cs!combo/cg',
  'cs!combo/plugins/physics/Physical',
  'cs!combo/plugins/ui/Interactive'
], function (
  cg,
  Physical,
  Interactive
) {

  var <%= name %> = <%= parentClass %>.extend('<%= name %>', {
    constructor: function (properties) {
      this._super(properties);
    },

    update: function () {
      this._super();
    }
  });

  <%= name %>.plugin(Physical, Interactive);

  return <%= name %>;
});
