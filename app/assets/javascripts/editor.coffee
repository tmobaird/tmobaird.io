$(document).on "turbolinks:load", ->
  # Converts image tags in the editor to actual html images that are remotely stored on the web
  # Ex. <img src='linktoimage.com' class='img-render'>
  # The image must have the class img-render
  # and both the src and class must be held in single quotes
  # Ideally want better solution than this.
  if document.querySelector(".trix-content")
    image_to_render = $("div:contains('img-render')").last()
    if image_to_render.length > 0
      elems = image_to_render.html().match(/src='(.+)'/)
      image_to_render.html("<img src='" + elems[elems.length - 1] + "'>")