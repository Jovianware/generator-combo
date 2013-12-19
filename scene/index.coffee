path = require 'path'
yeoman = require 'yeoman-generator'
util = require 'util'
fs = require 'fs'

ClassGenerator = require '../class'

module.exports = class ActorGenerator extends ClassGenerator
  root: -> __dirname
  usage: ->
    'yo combo:scene NAME [--extends=PARENTNAME] [--coffee]'

  constructor: (args, options, config) ->
    super

    @parentClass = @options.extends or 'cg.Scene'

  app: ->
    @template 'src/_Scene'+@ext, 'src/' + @name+@ext
