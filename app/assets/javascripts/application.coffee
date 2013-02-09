#= require ./vendor/underscore-1.4.4
#= require ./vendor/jquery-1.9.1
#= require ./vendor/jquery_ujs
#= require ./vendor/jquery-ui-1.10.0.custom
#= require ./vendor/jquery.externalscript
#= require ./vendor/jquery.readyselector
#= require ./vendor/jquery-linedtextarea
#= require ./vendor/jquery-uicombobox
#= require ./vendor/bootstrap-2.2.1
#= require ./vendor/backbone-0.9.10
#= require ./vendor/twitter-widgets
#= require ./vendor/jade-runtime.js
#= require_self
#= require_directory .

window.EasyEval = {}
window.EEData = {}

window.raise = (msg) ->
  throw new Error(msg)

