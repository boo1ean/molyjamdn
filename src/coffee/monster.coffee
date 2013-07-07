define [
	'dcl'
	'./config'
	'frozen/box2d/entities/Rectangle'
	'frozen/Sprite'
	'frozen/Animation'
	'frozen/plugins/loadSound!sfx/plasmagun'
], (dcl, config, Rectangle, Sprite, Animation, shotSound) ->
	'use strict'

	dcl [Sprite, Rectangle],
		restitution: -5
		linearDamping: 0
		angularDamping: 10000
		staticBody: false

		FORWARD: 1
		STAND: 0
		BACKWARD: -1

		direction: 0 # -1 | 0 | 1
		anim: 0

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
				@anims.run[@anim].draw ctx, (@x - @halfWidth) * scale, (@y - @halfHeight) * scale

		updateAnimations: (millis) ->
			@updateDirection()
			@anims.run[@anim].update millis 

		createAnimations: ->
			height = 2 * @halfHeight
			width  = 2 * @halfWidth

			if @gfx.run?
				@anims.run[0] = @getAnimation height, width, @gfx.run, 1
				@anims.run[1] = @getAnimation height, width, @gfx.run, 0

		getAnimation: (height, width, img, ySlot) ->
			anim = new Animation
			anim.createFromSheet config.framesCount, config.frameDuration, img, width, height, ySlot

		updateDirection: ->
			if @linearVelocity.x > 0
				@direction = @FORWARD
				@anim = 1
			else
				@direction = @BACKWARD
				@anim = 0

		fire: (game) ->
			console.log "asd"
			missle = Math.random()
			offset = @direction * (@halfWidth + config.projectile_margin)
			entity = new Rectangle
				id: missle
				x: @x * config.scale + offset
				y: @y * config.scale
				type: "destroy"

			game.addBody entity

			angle = if @direction is @FORWARD then 90 else 270
			game.box.applyImpulseDegrees missle, angle, config.projectile_speed

			shotSound.play()

			window.setTimeout ->
				game.removeBody entity
			, 300
