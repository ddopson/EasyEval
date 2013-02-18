#= require ./vendor/underscore-1.4.4
#= require ./vendor/jquery-1.9.1

# Boostrap HAS to be included before jquery-ui... weird
#= require ./vendor/bootstrap-2.2.1
#= require ./vendor/backbone-0.9.10

#= require ./vendor/jquery_ujs
#= require ./vendor/jquery-ui-1.10.0.custom
#= require ./vendor/jquery.externalscript
#= require ./vendor/jquery.readyselector
#= require ./vendor/jquery-linedtextarea
#= require ./vendor/jquery-uicombobox
#= require ./vendor/twitter-widgets
#= require ./vendor/jade-runtime
#= require_self
#= require ./widget
#= require_directory .

window.EasyEval = {}
window.EEData = {}

window.raise = (msg) ->
  throw new Error(msg)

$.fn.attr_map = (name) ->
  result = []
  for el in @
    if a = $(el).attr(name)
      result.push(a)
  return result

$.fn.outerHtml = ->
  @[0].outerHTML
