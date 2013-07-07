define [
	'lodash'
	'./config'
	'frozen/plugins/loadImage!gfx/background.jpg'
], (_, config,backgroundImg) ->
	(ctx) ->
		ctx.drawImage backgroundImg, @xOffset, -backgroundImg.height/5 + @yOffset,  backgroundImg.width,  backgroundImg.height
		
		# _.each @entities, (ent) ->
		# 	if ent.maskBits is null
		# 		ent.draw ctx, config.scale		

		for i in [10..0]
			_.each @entities, (ent) ->
				if ent.maskBits is i
					ent.draw ctx, config.scale