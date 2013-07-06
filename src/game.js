define([
  './update',
  './draw',
  'frozen/box2d/BoxGame',
  'frozen/box2d/entities',
  './boxData'
], function(update, draw, BoxGame, entities, boxData) {

  'use strict';

  //setup a GameCore instance
  var game = new BoxGame({
    canvasId: 'canvas',
    gameAreaId: 'gameArea',
    canvasPercentage: 0.95,
    update: update,
    draw: draw
  });

  boxData.entities.forEach(function(entity){
    if(entities[entity.type]){
      game.addBody(new entities[entity.type](entity));
    }
  });

  //launch the game!
  game.run();

});
