# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  header = $('.large-header')
  subHeader = $('#subtitle')
  fadeInElement(header,1000)
  fadeInElement(subHeader,2000)
  console.log(isOnScreena(header))

$(window).on "scroll", ->
  nav = $('.navbar')
  header = $('.large-header')
  if isOnScreena header
    if nav.hasClass("navbar-shadow")
      nav.removeClass("navbar-shadow")
  else
    if !(nav.hasClass("navbar-shadow"))
      nav.addClass("navbar-shadow")
  

fadeInElement = (elem,speed) ->
  elem.fadeIn(speed)
  elem.toggleClass("hidden")

isOnScreena = (elem) ->
  $window = $(window)
  viewportTop = $window.scrollTop()
  viewportHeight = $window.height()
  viewportBottom = viewportTop + viewportHeight
  $elem = $(elem)
  top = $elem.offset().top
  height = $elem.height()
  bottom = top + height
  (top >= viewportTop && top < viewportBottom) or
  (bottom > viewportTop && bottom <= viewportBottom) or
  (height > viewportHeight && top <= viewportTop && bottom >= viewportBottom)
