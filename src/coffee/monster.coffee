define [
  'dcl'
  'frozen/box2d/entities/Rectangle'
  'frozen/Sprite'
  'frozen/Animation'
], (dcl, Rectangle, Sprite, Animation) ->
	'use strict'

	dcl [Sprite, Rectangle],
		restitution: 1
		linearDamping: 0
		angularDamping: 0
		staticBody: false
		direction: 0
		anims: []
		img: null

		constructor: ->
			@createAnimations()

		draw: (ctx, scale) ->
			@anims[@direction].draw ctx, @x * scale, @y * scale

		updateAnimations: (millis) ->
			@updateDirection()
			@anims[@direction].update(millis)

		createAnimations: ->
			@anims = []
			for i in [0..7]
				@anims[i] = new Animation
					height: 96
					width: 96
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
