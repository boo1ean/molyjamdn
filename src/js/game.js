(function() {
  define(['./update', './draw', 'frozen/box2d/BoxGame', 'frozen/box2d/entities', './boxData', 'dojo/keys'], function(update, draw, BoxGame, entities, boxData, keys) {
    var game, speed;
    speed = 1;
    game = new BoxGame({
      canvasId: 'canvas',
      gameAreaId: 'gameArea',
      canvasPercentage: 0.95,
      update: update,
      draw: draw,
      initInput: function(im) {
        im.addKeyAction(keys.LEFT_ARROW);
        im.addKeyAction(keys.RIGHT_ARROW);
        im.addKeyAction(keys.UP_ARROW);
        return im.addKeyAction(keys.DOWN_ARROW);
      },
      handleInput: function(im) {
        if (im.keyActions[keys.LEFT_ARROW].isPressed()) {
          this.box.applyImpulseDegrees("player", 270, speed);
        }
        if (im.keyActions[keys.RIGHT_ARROW].isPressed()) {
          this.box.applyImpulseDegrees("player", 90, speed);
        }
        if (im.keyActions[keys.UP_ARROW].isPressed()) {
          return this.box.applyImpulseDegrees("player", 0, speed);
        }
      }
    });
    boxData.entities.forEach(function(entity) {
      if (entities[entity.type]) {
        return game.addBody(new entities[entity.type](entity));
      }
    });
    return game.run();
  });

}).call(this);
