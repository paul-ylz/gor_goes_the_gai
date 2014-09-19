class GorGoesTheGai.Views.Consonant extends Backbone.View

  template: JST['consonants/consonant']

  id: -> 'consonant_' + @model.get('id')

  className: 'consonant'

  render: ->
    $(@el).html @template( consonant: @model )
    $(@el).draggable()
    this
