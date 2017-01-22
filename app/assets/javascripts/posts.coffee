# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  posts = $('.post .post-body')
  appendText element for element in posts

  $("#view-tab").on "click", ->
    text = document.getElementById("post-body-form").value
    html_content = markdown.toHTML(text)
    $("#view-display").html(html_content)


appendText = (elem) ->
  if elem.innerHTML.length > 600
    substring = elem.innerHTML.substring(0,600) + "..."
    elem.innerHTML = substring