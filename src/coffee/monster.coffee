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
		restitution: 0
		linearDamping: 1
		angularDamping: 100000
		staticBody: false

		type: "monster"

		states:
			WALKING: 0
			STANDING: 1

		directions:
			LEFT: 0
			RIGHT: 1

		direction: 0 # -1 | 0 | 1
		state: 0

		anims:
			run: {}
			fire: {}
			jump: {}

		gfx:
			run: null
			fire: null
			jump: null

		jumpForce: 90

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
				@anims.run[0] = @getAnimation height, width, @gfx.run, 1
				@anims.run[1] = @getAnimation height, width, @gfx.run, 0

		getAnimation: (height, width, img, ySlot) ->
			anim = new Animation
			anim.createFromSheet config.framesCount, config.frameDuration, img, width, height, ySlot

		updateDirection: ->
			x = @linearVelocity.x
			if Math.abs(x) > 0.3
				@state     = @states.WALKING
				@direction = if x > 0 then @directions.RIGHT else @directions.LEFT
			else
				@states.STANDING

		fire: (game) ->
			missle = Math.random()

			dir    = if @direction is @directions.LEFT then -1 else 1
			offset = dir * (@halfWidth + config.projectile_margin)
			debugger
			entity = new Rectangle
				source: @
				id: missle
				x: @x * config.scale + offset
				y: @y * config.scale
				type: "destroy"

			game.addBody entity

			angle = if @direction is @directions.RIGHT then 90 else 270
			game.box.applyImpulseDegrees missle, angle, config.projectile_speed

			shotSound.play()

			window.setTimeout ->
				game.removeBody entity
			, 300

		jump: (game) ->
			if -0.01 < @linearVelocity.y < 0.01
				console.log @linearVelocity
				game.box.applyImpulseDegrees @id, 0, @jumpForce

		onHit: (game, entity) ->
			console.log "Hit!"
