class GorGoesTheGai.Views.ConsonantsIndex extends Backbone.View

  template: JST['consonants/index']

  id: 'app'

  initialize: ->
    @correctAnswers = new Array
    @wrongAnswers   = new Array

  render: ->
    $(@el).html @template()
    @collection.reset @collection.shuffle()
    @collection.each @appendConsonant
    @setConsonantsToDroppable()
    this

  events:
    'drop .bucket': 'manageDrop'

  setConsonantsToDroppable: ->
      @$('.bucket').droppable
        accept: '.consonant'

  manageDrop: (e, ui) =>
    @releaseOver(e)

    consonant       = $(ui.draggable).text()
    consonant_class = $(ui.draggable).data('consonant_class')
    bucket          = e.target.id

    if consonant_class == bucket
      @correctAnswers.push consonant
    else
      @wrongAnswers.push
        consonant: consonant
        bucketChosen: bucket
        correctAnswer: consonant_class

    $(ui.draggable).trigger 'bucketed'
    @updateScoreboard()

  releaseOver: (e) ->
    $(e.target).addClass 'release'
    window.setTimeout(@removeReleaseOver, 500, $(e.target))

  removeReleaseOver: ($el) ->
    $el.removeClass 'release'

  appendConsonant: (consonant) =>
    view = new GorGoesTheGai.Views.Consonant( model: consonant )
    @$('#main').append view.render().el

  updateScoreboard: ->
    if @correctAnswers.length + @wrongAnswers.length < 44
      @$('#score').html("<span class='correct'>#{@correctAnswers.length}<span> <span class='wrong'>#{@wrongAnswers.length}</span>")
    else
      @reportResult()

  reportResult: ->
    correct = "<p>Congratulations! You got " + @correctAnswers.length + " / 44 consonants right.</p>" + "<p>#{@correctAnswers.join(' ')}</p>" + "<p>Well done!</p>"
    wrong   = ''
    @wrongAnswers.forEach (element, index, array) ->
      wrong += "#{element['consonant']}: You thought it was #{element['bucketChosen']} class, but it was actually #{element['correctAnswer']}<br/>"
    @$('#main').append correct
    @$('#main').append wrong