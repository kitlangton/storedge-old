# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".button-panel .button").hover (->
    $(@).stop(true,false).velocity
      borderBottomWidth: 1
      translateY: 2
    ,
      duration: 100
  ), ->
    $(@).stop(true,false).velocity
      borderBottomWidth: 3
      translateY: 0
    ,
      duration: 100
