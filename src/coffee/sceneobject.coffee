define [
	'dcl'
	'frozen/box2d/entities/Rectangle'
], (dcl, Rectangle) ->
	dcl [Rectangle],
		constructor: dcl.superCall (sup) ->
			(entity, img) ->
				@img = img

				entity.halfWidth  = img.width/2
				entity.halfHeight = img.height/2

				sup.apply @, arguments

		draw: dcl.superCall (sup) ->
			(ctx, scale) ->
				sup.apply @, arguments if config # DEBUG
				ctx.drawImage @img, (@x - @halfWidth) * scale, (@y - @halfHeight) * scale, @img.width,@img.height
