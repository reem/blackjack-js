class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    (@trigger 'bust') if _.all (do @scores), ((score) -> score > 21)

  stand: ->
    @trigger 'stand'


  play: ->
    # Only called by the dealer
    @at(0).flip()
    setTimeout(timedWhile(
      (=> _.any (do @scores), ((score) -> score <= 17)),
      (=> do @hit),
      750,
      (=> @trigger 'dealerScore', Math.max.apply(null, do @scores)))
    , 750)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

timedWhile = (condition, callback, time, final) ->
  if condition()
    callback()
    setTimeout((-> timedWhile(condition, callback, time, final)), time)
  else
    final()
