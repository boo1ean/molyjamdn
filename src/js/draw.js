define([

], function(){

  'use strict';

  return function(ctx){
    ctx.fillRect(0, 0, this.width, this.height);
    var scale = 30;
    for(var id in this.entities){
      this.entities[id].draw(ctx, scale);
    }
  };

});
