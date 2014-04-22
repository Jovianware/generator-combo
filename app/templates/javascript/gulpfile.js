var gulp = require('gulp');
    path = require('path');
    source = require('vinyl-source-stream');
    streamify = require('gulp-streamify');
    exorcist = require('exorcist');
    uglify = require('gulp-uglify');
    gulpif = require('gulp-if');
    browserify = require('browserify');
    coffeeify = require('coffeeify');
    watchify = require('watchify');

bundle = function(b, debug) {
  if (debug == null) {
    debug = false;
  }
  return b.bundle({
    debug: true
  }).pipe(exorcist(path.join(__dirname, 'src/main-built.js.map'))).pipe(source('main-built.js')).pipe(gulpif(!debug, streamify(uglify({
    inSourceMap: path.join(__dirname, 'src/main-built.js.map'),
    outSourceMap: path.join(__dirname, 'src/main-built.js.map')
  })))).pipe(gulp.dest('./src/'));
};

createBundler = function(_browserify) {
  var b;
  b = _browserify({
    extensions: ['.coffee'],
    paths: [path.join(__dirname, 'node_modules/combo/src/combo'), path.join(__dirname, 'src')]
  });
  b.add(path.join(__dirname, 'src/main.coffee'));
  return b.transform(coffeeify);
};

gulp.task('build', function() {
  return bundle(createBundler(browserify));
});

gulp.task('watch', function() {
  var b;
  b = createBundler(watchify);
  b.on('update', function() {
    var a, _i, _len, _results;
    bundle(b, true);
    _results = [];
    for (_i = 0, _len = arguments.length; _i < _len; _i++) {
      a = arguments[_i];
      _results.push(console.log(a));
    }
    return _results;
  });
  return bundle(b, true);
});

gulp.task('default', ['build']);
