/*jshint globalstrict:true*/
/*global module:false, process:false*/
'use strict';

var path = require('path');
var connectLR = require('connect-livereload');

// Workaround for Windows giving Error 108 (ERR_ADDRESS_INVALID) when opening 0.0.0.0
var hostname = process.platform !== 'win32' ? '0.0.0.0' : 'localhost';

module.exports = function(grunt) {
  // Project configuration.
  grunt.initConfig({
    coffee: {
      compile: {
        files: {
          "src/js/config.js" : "src/coffee/config.coffee",
          "src/js/update.js" : "src/coffee/update.coffee",
          "src/js/draw.js" : "src/coffee/draw.coffee",
          "src/js/game.js" : "src/coffee/game.coffee",
          "src/js/monster.js" : "src/coffee/monster.coffee",
          "src/js/badguy.js" : "src/coffee/badguy.coffee",
          "src/js/handle-input.js" : "src/coffee/handle-input.coffee",
          "src/js/init-input.js" : "src/coffee/init-input.coffee",
          "src/js/collisions-listener.js" : "src/coffee/collisions-listener.coffee",
          "src/js/data/utils/generator.js" : "src/coffee/generator.coffee",
          "src/js/sceneobject.js" : "src/coffee/sceneobject.coffee",
          "src/js/enemy.js" : "src/coffee/enemy.coffee",
          "src/js/movie.js" : "src/coffee/movie.coffee",
        }
      }
    },

    jshint: {
      game: [
        'Gruntfile.js',
        'config.js',
        'src/**/*.js'
      ],
      options: {
        jshintrc: '.jshintrc'
      }
    },
    clean: {
      dist: ['dist/', 'libs/'],
      deps: ['deps/', 'node_modules/'],
      all: ['<%= clean.dist %>', '<%= clean.deps %>']
    },
    connect: {
      game: {
        options: {
          middleware: function(connect, options) {
            return [connectLR(), connect.static(path.resolve(options.base))];
          }
        }
      },
      options: {
        hostname: hostname,
        port: 8000,
        keepalive: false
      }
    },
    open: {
      game: {
        path: 'http://<%= connect.options.hostname %>:<%= connect.options.port %>/'
      }
    },
    watch: {
      game: {
        files: ['src/js/data/*.js', 'src/**/*.coffee', 'styles/**/*.css', 'config.js', 'index.html'],
        tasks: ['coffee'],
        options: {
          livereload: true
        }
      }
    },
    dojo: {
      game: {},
      options: {
        dojo: 'deps/dojo/dojo.js',
        profile: 'game.profile.js',
        'package': './',
        dojoConfig: 'config.js',
        cwd: './'
      }
    }
  });

  grunt.loadNpmTasks('grunt-dojo');
  grunt.loadNpmTasks('grunt-open');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-coffee');

  // Default task.
  grunt.registerTask('default', ['connect:game', 'coffee', 'open:game', 'watch:game']);

  grunt.registerTask('build', ['dojo:game']);

};
