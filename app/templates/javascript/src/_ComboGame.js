var cg = require('cg'),
    <%= _.classify(gameName) %>;

<%= _.classify(gameName) %> = cg.Scene.extend('<%= _.classify(gameName) %>', {
  constructor: function (properties) {
    this._super(properties);

    this.logo = this.addChild(new cg.Actor({
      texture: 'logo',
      anchorX: 0.5,
      anchorY: 0.5,
      x: cg.width/2,
      y: cg.height/2
    }));
  },

  update: function () {
    this._super();

    this.logo.rotation += 0.02;
  }
});

module.exports = <%= _.classify(gameName) %>;
