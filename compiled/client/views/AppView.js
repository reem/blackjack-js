// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.AppView = (function(_super) {
    __extends(AppView, _super);

    function AppView() {
      return AppView.__super__.constructor.apply(this, arguments);
    }

    AppView.prototype.initialize = function() {
      this.gameView = new GameView({
        model: this.model.get('game')
      });
      return this.render();
    };

    AppView.prototype.render = function() {
      this.$el.append(this.gameView.render().el);
      return console.log(this.$el.html());
    };

    return AppView;

  })(Backbone.View);

}).call(this);
