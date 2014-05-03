class window.AppView extends Backbone.View
  initialize: ->
    @gameView = new GameView(model: @model.get('game'))
    do @render
    @model.on 'newGame', (=> do @render)

  render: ->
    @$el.append(@gameView.render().el)
