module.exports = (grunt) ->
  config =
    pkg: grunt.file.readJSON 'package.json'
    connect:
      server:
        options:
          port: 9042
          base: 'src'
          directory: 'src'
          keepalive: true
    copy:
      html:
        expand: true
        cwd: 'src'
        src: ['**/*.html','!support/**']
        dest: 'dist'
      assets:
        expand: true
        cwd: 'src'
        src: ['**/assets/**','!support/**']
        dest: 'dist'
    requirejs:
      build:
        options:
          packages: [
            name: 'cs',
            location: 'support/require-cs',
            main: 'cs'
          ,
            name: 'coffee-script',
            location: 'support/coffee-script',
            main: 'index'
          ,
            name: 'combo',
            location: 'support/combo/src/combo'
          ]
          baseUrl: 'src'
          name: 'support/almond/almond'
          include: 'mainWrapper'
          insertRequire: ['mainWrapper']
          exclude: ['coffee-script']
          out: "dist/main-built.js"

  grunt.initConfig config

  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['copy', 'requirejs']
