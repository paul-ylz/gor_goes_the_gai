class GorGoesTheGai.Routers.Consonants extends Backbone.Router

  initialize: ->
    @collection = new GorGoesTheGai.Collections.Consonants
    @collection.reset $('#container').data('consonants')

  routes:
    '': 'index'

  index: ->
    view = new GorGoesTheGai.Views.ConsonantsIndex(collection: @collection)
    $('#container').html view.render().el
