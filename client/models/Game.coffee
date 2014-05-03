class window.Game extends Backbone.Model
  initialize: -> do @reset


  reset: ->
    @deck = new Deck()
    @set 'playerHand', @deck.dealPlayer()
    @set 'dealerHand', @deck.dealDealer()
    (@get 'playerHand').on('bust': =>
      alert "YOU LOSE!!12!!"
      @trigger 'reset')
    (@get 'playerHand').on('stand': =>
      (@get 'dealerHand').play(Math.max.apply(null, @get('playerHand').scores()))
    )
    (@get 'dealerHand').on('bust': =>
      alert "YOU WIN!!12!!"
      @trigger 'reset')
    (@get 'dealerHand').on('dealerScore': (dealerScore) =>
      if dealerScore < Math.max.apply(null, @get('playerHand').scores())
        alert "YOU WIN!!12!!"
      else
        alert "YOU LOSE!!12!!"
      @trigger 'reset'
    )
    @

  dealerAction: ->
