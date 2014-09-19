class GorGoesTheGai.Views.Consonant extends Backbone.View

  template: JST['consonants/consonant']

  id: -> 'consonant_' + @model.get('id')

  className: 'consonant'

  render: ->
    $(@el).html @template(consonant: @model)
    $(@el).draggable
      revert: 'invalid'
      helper: 'clone'
      start: @onStartDrag
      stop: (e) -> $(e.target).removeClass 'dragging'
    this

  events:
    'bucketed': -> @remove()

  onStartDrag: (e, ui) =>
    $(e.target).addClass 'dragging'
    ui.helper.data.consclass = @model.get('char_class')
    ui.helper.data.id = @id()
