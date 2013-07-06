define [
	'dcl'
	'frozen/box2d/entities/Entity'
], (dcl, Entity) ->
	'use strict'

	dcl [Entity],
		constructor: dcl.superCall (sup) ->
			(entity, img) ->
				@img = img
				#console.log img.width
				@halfWidth = img.width/2
				@halfHeight = img.height/2
				sup.apply @,arguments

		draw: (ctx, scale) ->
				#console.log "image: ",@img
				ctx.drawImage @img, @x * scale, @y * scale, @img.width, @img.height
			

