path = require 'path'
yeoman = require 'yeoman-generator'
util = require 'util'
fs = require 'fs'

module.exports = class ClassGenerator extends yeoman.generators.Base
  root: -> __dirname
  usage: ->
    'yo combo:class NAME [--extends=PARENTNAME] [--coffee]'

  constructor: (args, options, config) ->
    super

    @argument 'name',
      type: String
      required: false

    @option 'extends',
      type: String
      desc: 'Full name of the class you wish to extend'
      default: 'cg.Module'
      required: 'false'

    @option 'coffee',
      type: Boolean
      desc: 'Generate CoffeeScript instead of JavaScript'

    # attempt to detect if user is using CS or not
    # if cml arg provided, use that; else look for the existence of cs
    if (!@options.coffee && @expandFiles('src/*.coffee', {}).length > 0)
      @options.coffee = true

    if @options.coffee
      @sourceRoot path.join @root(), '/templates/coffeescript'
      @ext = '.coffee'
      @mainPrefix = 'cs!'
    else
      @sourceRoot path.join @root(), '/templates/javascript'
      @ext = '.js'
      @mainPrefix = ''

    # TODO: autodetect and `require` extended class file
    # HACK: default doesn't work? yeoman bug? hmm...
    @parentClass = @options.extends or 'cg.Module'

    if not @name?
      console.log @help()
      process.exit -1

  app: ->
    @template 'src/_Class'+@ext, 'src/' + @name+@ext
