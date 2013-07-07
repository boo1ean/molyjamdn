define [
	'dcl'
	'frozen/box2d/entities/Rectangle'
], (dcl, Entity) ->
	'use strict'

	#here Entity is just a deprecated name, it is Rectangle for real
	#using Entity itself here leading to some unpredictable collision box behaviour
	dcl [Entity],
		constructor: dcl.superCall (sup) ->
			(entity, img) ->
				@img = img
				if entity.type is 'Rectangle'
					entity.halfWidth = img.width/2
					entity.halfHeight = img.height/2
				sup.apply @,arguments

		draw: dcl.superCall (sup) ->
			(ctx, scale) ->
				#uncomment to show collision box
				# sup.apply @,arguments
				ctx.drawImage @img, (@x - @halfWidth) * scale, (@y - @halfHeight) * scale, @img.width,@img.height
			

