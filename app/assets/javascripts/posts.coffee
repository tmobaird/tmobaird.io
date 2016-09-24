# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  console.log("test")
  cardTexts = $('.card-text .post-body')
  appendText element for element in cardTexts
  $("#view-tab").on "click", ->
    text = document.getElementById("post-body-form").value
    html_content = markdown.toHTML(text)
    $("#view-display").html(html_content)


appendText = (elem) ->
  if document.querySelector(".post-body").innerHTML.length > 400
    substring = elem.innerHTML.substring(0,400) + "<br />..."
    elem.innerHTML = substring