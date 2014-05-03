class window.App extends Backbone.Model

  initialize: ->
    @set "game", game = new Game()
    (@get 'game').on 'reset', => do game.reset; @trigger 'newGame'
