# Event listener that performs some 
# Google Analytics actions if function `ga`
# exists.
document.addEventListener 'turbolinks:load', (event) ->
  if typeof ga is 'function'
    ga('set', 'location', event.data.url)
    ga('send', 'pageview')
