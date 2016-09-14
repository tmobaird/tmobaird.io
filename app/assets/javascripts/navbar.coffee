$(document).on "turbolinks:load", ->
  header = $('.large-header')
  subHeader = $('#subtitle')
  if document.querySelector(".large-header")
    fadeInElement(header,1000)
    fadeInElement(subHeader,2000)
    console.log(isOnScreena(header))

$(window).on "scroll", ->
  nav = $('.navbar')
  header = $('.large-header')
  if document.querySelector(".large-header")
    if isOnScreena header
      if nav.hasClass("navbar-shadow")
        nav.removeClass("navbar-shadow")
    else
      if !(nav.hasClass("navbar-shadow"))
        nav.addClass("navbar-shadow")
  else if document.body.scrollTop == 0
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
