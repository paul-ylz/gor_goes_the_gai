class GorGoesTheGai.Views.ConsonantsIndex extends Backbone.View

  template: JST['consonants/index']

  initialize: ->
    @correctAnswers = new Array
    @wrongAnswers   = new Array

  render: ->
    $(@el).html @template()
    @collection.reset @collection.shuffle()
    @collection.each @appendConsonant
    @setConsonantsToDroppable()
    this

  appendConsonant: (consonant) =>
    view = new GorGoesTheGai.Views.Consonant( model: consonant )
    @$('#main').append view.render().el

  setConsonantsToDroppable: ->
    @$('.bucket').droppable
      accept: '.consonant'
      drop: @checkAnswer

  checkAnswer: (e, ui) =>
    char      = $(ui.helper).html()
    consclass = ui.helper.data.consclass
    bucket    = e.target.id
    if consclass == bucket
      @correctAnswers.push char
    else
      @wrongAnswers.push
        char: char
        bucketChosen: bucket
        correctAnswer: consclass
    $(ui.draggable).trigger('bucketed')
    @updateScoreboard()

  updateScoreboard: ->
    if @correctAnswers.length + @wrongAnswers.length < 44
      @$('#score').html("<span class='correct'>#{@correctAnswers.length}<span> <span class='wrong'>#{@wrongAnswers.length}</span>")
    else
      @reportResult()

  reportResult: ->
    correct = "Congratulations! You got #{@correctAnswers.length} consonants right.<br/>"
    correct += @correctAnswers.join(' ')
    correct += "<br/>Well done!"
    wrong   = ''
    @wrongAnswers.forEach (element, index, array) ->
      wrong += "#{element['char']}: You thought it was #{element['bucketChosen']} class, but it was actually #{element['correctAnswer']}<br/>"
    @$('#main').append correct
    @$('#main').append wrong