# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  console.log("test")
  cardTexts = $('.card-text .post-body')
  appendText element for element in cardTexts


appendText = (elem) ->
  if document.querySelector(".post-body").innerHTML.length > 400
    substring = elem.innerHTML.substring(0,400) + "<br />..."
    elem.innerHTML = substring