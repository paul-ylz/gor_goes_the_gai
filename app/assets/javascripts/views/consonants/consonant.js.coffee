class GorGoesTheGai.Views.Consonant extends Backbone.View

  template: JST['consonants/consonant']

  id: -> 'consonant_' + @model.get('id')

  attributes:
    'draggable': true
    'class': 'consonant'

  render: ->
    $(@el).html @template( consonant: @model )
    this
