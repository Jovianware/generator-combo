module.exports = function (grunt) {
  var config = {
    pkg: grunt.file.readJSON('package.json'),

    requirejs: {
      build: {
        options: {
          baseUrl: 'src',
          paths: {
            'cs': 'support/require-cs/cs',
            'coffee-script': 'support/coffee-script/index',
            'combo': 'support/combo/src/combo'
          },
          stubModules: ['cs', 'coffee-script'],
          name: 'support/almond/almond',
          include: 'mainWrapper',
          insertRequire: ['mainWrapper'],
          out: 'src/main-built.js',
          optimize: 'uglify2'
        }
      }
    },

    connect: {
      server: {
        options: {
          port: 9042,
          base: 'src',
          directory: 'src',
          keepalive: true
        }
      }
    },

    open: {
      dev: {
        path: 'http://127.0.0.1:9042/?debug=1'
      },
      prod: {
        path: 'http://127.0.0.1:9042/'
      }
    }
  };

  grunt.initConfig(config);

  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-requirejs');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-open');

  grunt.registerTask('default', ['requirejs']);
  grunt.registerTask('dev', ['open:dev', 'connect']);
  grunt.registerTask('prod', ['requirejs', 'open:prod', 'connect']);
};
