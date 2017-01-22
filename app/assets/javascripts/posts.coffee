# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  posts = $('.post .post-body')
  # Post index page post preview
  appendText element for element in posts

  # In edit rendering
  $("#view-tab").on "click", ->
    text = $("#post-body-form").first().val()
    $.ajax
      url: '/posts/markdown.json'
      type: 'POST'
      dataType: 'json'
      data: { content: text }
      error: (jqXHR, textStatus, errorThrown) ->
        $('#view-display').html "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('#view-display').html data.parsed_html
        PR.prettyPrint()


appendText = (elem) ->
  if elem.innerHTML.length > 600
    substring = elem.innerHTML.substring(0,600) + "..."
    elem.innerHTML = substring
    