/*global describe, beforeEach, it*/
'use strict';

var path    = require('path');
var helpers = require('yeoman-generator').test;

describe('combo generator', function () {
  beforeEach(function (done) {
    helpers.testDirectory(path.join(__dirname, 'temp'), function (err) {
      if (err) {
        return done(err);
      }

      this.app = helpers.createGenerator('combo:app', [
        '../../app'
      ]);
      done();
    }.bind(this));
  });

  it('creates expected files', function (done) {
    var expected = [
      '.bowerrc',
      '.editorconfig',
      '.gitignore',
      'bower.json',
      'Gruntfile.js',
      'package.json',
      'src/ComboGame.js',
      'src/assets',
      'src/index.html',
      'src/main.js',
      'src/mainWrapper.js'
    ];

    helpers.mockPrompt(this.app, {
      'gameName': 'Combo Game'
    });

    this.app.options['skip-install'] = true;
    this.app.run({}, function () {
      helpers.assertFiles(expected);
      done();
    });
  });
});
