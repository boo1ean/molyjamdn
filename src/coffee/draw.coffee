define [
	'lodash'
	'./config'
], (_, config) ->
	(ctx) ->
		ctx.fillRect 0, 0, @width, @height
		_.each @entities, (ent) ->
			ent.draw ctx, config.scale
