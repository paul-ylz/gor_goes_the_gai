window.GorGoesTheGai =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new GorGoesTheGai.Routers.Consonants
    Backbone.history.start(pushState: true)

$(document).ready ->
  GorGoesTheGai.initialize()
