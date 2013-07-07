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

		RIGHT: 0
		LEFT: 1

		direction: 0 # -1 | 0 | 1

		anims:
			run: {}
			fire: {}
			jump: {}

		gfx:
			run: null
			fire: null
			jump: null

		constructor: (id) ->
			@id = id if id?
			@createAnimations()

		draw: dcl.superCall (sup) ->
			(ctx, scale) ->
				sup.apply @,arguments if config.debug
				@anims.run[@direction].draw ctx, (@x - @halfWidth) * scale, (@y - @halfHeight) * scale

		updateAnimations: (millis) ->
			@updateDirection()
			@anims.run[@direction].update millis 

		createAnimations: ->
			height = 2 * @halfHeight
			width  = 2 * @halfWidth

			if @gfx.run?
				@anims.run[@RIGHT] = @getAnimation height, width, @gfx.run, 0
				@anims.run[@LEFT] = @getAnimation height, width, @gfx.run, 0

		getAnimation: (height, width, img, ySlot) ->
			anim = new Animation
			anim.createFromSheet config.framesCount, config.frameDuration, img, width, height, ySlot

		updateDirection: ->
			@direction = (@linearVelocity.x > 0) - 0
