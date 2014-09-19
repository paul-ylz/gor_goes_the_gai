class GorGoesTheGai.Views.Consonant extends Backbone.View

  template: JST['consonants/consonant']

  id: -> 'consonant_' + @model.get('id')

  className: 'consonant'

  attributes: ->
    'data-consonant_class': => @model.get('consonant_class')

  render: ->
    $(@el).html @template(consonant: @model)
    @setDraggable()
    this

  events:
    'bucketed': -> @remove()

  setDraggable: ->
    $(@el).draggable
      start: (e, ui) ->
        ui.helper.addClass 'grabbing'
      stop: (e, ui) ->
        ui.helper.removeClass 'grabbing'
      stack: '.consonant'
