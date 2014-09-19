class GorGoesTheGai.Views.ConsonantsIndex extends Backbone.View

  template: JST['consonants/index']

  render: ->
    $(@el).html @template()
    @collection.each @appendConsonant
    @$('#low_class').droppable( accept: '.consonant' )
    this

  appendConsonant: (consonant) =>
    view = new GorGoesTheGai.Views.Consonant( model: consonant )
    @$('#unsorted_consonants').append view.render().el