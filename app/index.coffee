path = require 'path'
yeoman = require 'yeoman-generator'
fs = require 'fs'
coffee = require 'coffee-script'

module.exports = class ComboGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super

    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']

    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'

    @option 'coffee',
      type: 'Boolean'
      desc: 'Generate CoffeeScript instead of JavaScript'

    # attempt to detect if user is using CS or not
    # if cml arg provided, use that; else look for the existence of cs
    if (!@options.coffee && @expandFiles('src/*.coffee', {}).length > 0)
      @options.coffee = true

    if @options.coffee
      @sourceRoot path.join __dirname, '/templates/coffeescript'
      @ext = '.coffee'
    else
      @sourceRoot path.join __dirname, '/templates/javascript'
      @ext = '.js'

    @combo = """ _____  _____ ___  _________  _____
                /  __ \\|  _  ||  \\/  || ___ \\|  _  |
                | /  \\/| | | || .  . || |_/ /| | | |
                | |    | | | || |\\/| || ___ \\| | | |
                | \\__/\\\\ \\_/ /| |  | || |_/ /\\ \\_/ /
                 \\____/ \\___/ \\_|  |_/\\____/  \\___/

             """

  askFor: ->
    cb = @async()

    # have ~~Yeoman~~ COMBO greet the user.
    console.log @combo

    prompts = [
      name: 'gameName'
      message: 'What do you want to call your game?'
      default: 'Combo Game'
    ]

    @prompt prompts, (props) =>
      @gameName = props.gameName
      cb()

  app: ->
    @mkdir 'src'
    @mkdir 'src/assets'

    @template 'src/_ComboGame'+@ext, 'src/' + @_.classify(@gameName)+@ext
    @template 'src/_main'+@ext, 'src/main'+@ext
    @template '../common/src/_index.html', 'src/index.html'

    # package configs/dotfiles
    @template '../common/_package.json', 'package.json'

    @template '../common/_gulpfile.coffee', 'gulpfile.coffee'

    # if @ext isnt '.coffee'
    #   gulpfile_coffee = @dest.read 'gulpfile.coffee'
    #   @dest.write 'gulpfile.js', coffee.compile(gulpfile_coffee, {bare:true})
    #   @dest.delete 'gulpfile.coffee'

    @copy '../common/editorconfig', '.editorconfig'
    @copy '../common/gitignore', '.gitignore'
    @copy '../common/src/assets.json', 'src/assets.json'
    @copy '../common/src/assets/logo.png', 'src/assets/logo.png'
