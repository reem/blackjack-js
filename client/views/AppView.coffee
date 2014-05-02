class window.AppView extends Backbone.View
  initialize: ->
    @gameView = new GameView(model: @model.get('game'))
    do @render

  render: ->
    @$el.append(@gameView.render().el)
    console.log @$el.html()
