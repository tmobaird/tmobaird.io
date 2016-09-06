# Blocking blog button in footer
$(document).on "turbolinks:load", ->
  $('.blog-link').tooltip({title: "Sorry! My blog is currently not production ready.<br/> It will be up soon, so don't go too far :)", trigger: "click", html: true})
  # Currently makes footer link not go to top of page
  $('.blog-link').on "click", (e) -> 
    console.log("testing")
    e.preventDefault()
  $('[data-toggle="tooltip"]').tooltip() 
