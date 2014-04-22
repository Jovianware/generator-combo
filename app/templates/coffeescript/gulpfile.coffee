gulp = require 'gulp'
path = require 'path'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
exorcist = require 'exorcist'
uglify = require 'gulp-uglify'
gulpif = require 'gulp-if'

browserify = require 'browserify'
coffeeify = require 'coffeeify'
watchify = require 'watchify'

bundle = (b, debug=false) ->
  b.bundle({debug: true})
  .pipe exorcist path.join __dirname, 'src/main-built.js.map'
  .pipe source 'main-built.js'
  .pipe gulpif !debug, streamify uglify
    inSourceMap: path.join __dirname, 'src/main-built.js.map'
    outSourceMap: path.join __dirname, 'src/main-built.js.map'
  .pipe gulp.dest './src/'

createBundler = (_browserify) ->
  b = _browserify
    extensions: ['.coffee']
    paths: [
      path.join __dirname, 'node_modules/combo/src/combo'
      path.join __dirname, 'src'
    ]

  b.add path.join __dirname, 'src/main.coffee'
  b.transform coffeeify

gulp.task 'build', ->
  bundle createBundler browserify

gulp.task 'watch', ->
  b = createBundler watchify
  b.on 'update', ->
    bundle b, true
    for a in arguments
      console.log a
  bundle b, true

gulp.task 'default', ['build']
