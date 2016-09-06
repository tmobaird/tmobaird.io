# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Used to extend main card on about me section
$(document).on "turbolinks:load", ->
  $(".show-additional-content").on "click", ->
    button = $(".show-additional-content")
    content = $(".additional-content")
    content.slideToggle 500, ->
      button.text ->
        if content.is(":visible") then "Collapse" else "Show More"

