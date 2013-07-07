define [
	'lodash'
	'./config'
	'frozen/plugins/loadImage!gfx/background.jpg'
], (_, config,backgroundImg) ->
	(ctx) ->
		ctx.drawImage backgroundImg, @xOffset, -backgroundImg.height/5,  backgroundImg.width,  backgroundImg.height
		_.each @entities, (ent) ->
			ent.draw ctx, config.scale
