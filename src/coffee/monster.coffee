define [
  'dcl'
  './config'
  'frozen/box2d/entities/Rectangle'
  'frozen/Sprite'
  'frozen/Animation'
], (dcl, config, Rectangle, Sprite, Animation) ->
	'use strict'

	dcl [Sprite, Rectangle],
		restitution: -5
		linearDamping: 0
		angularDamping: 10000
		staticBody: false
		direction: 0
		anims: []
		img: null

		constructor: (id) ->
			@id = id if id?
			@createAnimations()

		draw: (ctx, scale) ->
			@anims[@direction].draw ctx, (@x - @halfHeight) * scale, (@y - @halfHeight) * scale

		updateAnimations: (millis) ->
			@anims[@direction].update(millis)

		createAnimations: ->
			@anims = []
			height = 2 * @halfHeight
			width  = 2 * @halfWidth
			for i in [0..7]
				@anims[i] = new Animation
					height: height
					width: width
					image: @img

				for j in [0..7]
					@anims[i].addFrame 125, j + 8 * i, 0

		updateDirection: ->
			if @linearVelocity
				degrees = degreesFromCenter null, @linearVelocity

			if degrees >= 22.5 and degrees < 67.5
				@direction = @statics.NORTHEAST

			else if degrees >= 67.5 and degrees < 112.5
				@direction = @statics.EAST

			else if degrees >= 112.5 and degrees < 157.5
				@direction = @statics.SOUTHEAST

			else if degrees >= 157.5 and degrees < 202.5
				@direction = @statics.SOUTH

			else if degrees >= 202.5 and degrees < 247.5
				@direction = @statics.SOUTHWEST

			else if degrees >= 247.5 and degrees < 292.5
				@direction = @statics.WEST

			else if degrees >= 292.5 and degrees < 337.5
				@direction = @statics.NORTHWEST

			else
				@direction = @statics.NORTH
