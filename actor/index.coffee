path = require 'path'
yeoman = require 'yeoman-generator'
util = require 'util'
fs = require 'fs'

ClassGenerator = require '../class'

module.exports = class ActorGenerator extends ClassGenerator
  root: -> __dirname
  usage: ->
    'yo combo:actor NAME [--extends=PARENTNAME] [--coffee]'

  constructor: (args, options, config) ->
    super

    @parentClass = @options.extends or 'cg.Actor'
    @baseType = @parentClass in ['cg.Actor']

  app: ->
    @template 'src/_Actor'+@ext, 'src/' + @name+@ext
