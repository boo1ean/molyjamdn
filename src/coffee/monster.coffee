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
		fixedRotation: true
		staticBody: false

		hp: 5
		type: "monster"

		states:
			WALKING: 0
			STANDING: 1

		directions:
			LEFT: 0
			RIGHT: 1

		isFiring: false
		killed: false
		direction: 0
		state: 0

		anims:
			run: {}
			fire: {}
			jump: {}
			stand: {}
			fireRun: {}

		gfx:
			run: null
			fire: null
			jump: null
			stand: null
			fireRun: null

		jumpForce: 140

		constructor: (id) ->
			@id = id if id?
			@createAnimations()

		draw: dcl.superCall (sup) ->
			(ctx, scale) ->
				sup.apply @,arguments if config.debug
				@currentAnimation().draw ctx, (@x - @halfWidth) * scale, (@y - @halfHeight) * scale

		updateAnimations: (millis) ->
			@updateDirection()
			@currentAnimation().update millis

		currentAnimation: ->
			if @isFiring
				if @state is @states.WALKING
					return @anims.fireRun[@direction]
				if @state is @states.STANDING
					return @anims.fire[@direction]
			else
				if @state is @states.WALKING
					return @anims.run[@direction]
				if @state is @states.STANDING
					return @anims.stand[@direction]

		createAnimations: ->
			height = 2 * @halfHeight
			width  = 2 * @halfWidth

			if @gfx.run?
				@anims.run[0] = @getAnimation height, width, @gfx.run, 1
				@anims.run[1] = @getAnimation height, width, @gfx.run, 0

			if @gfx.stand?
				@anims.stand[0] = @getAnimation height, width, @gfx.stand, 1
				@anims.stand[1] = @getAnimation height, width, @gfx.stand, 0

			if @gfx.fire?
				@anims.fire[0] = @getAnimation height, width, @gfx.fire, 1
				@anims.fire[1] = @getAnimation height, width, @gfx.fire, 0

			if @gfx.fireRun?
				@anims.fireRun[0] = @getAnimation height, width, @gfx.fireRun, 1
				@anims.fireRun[1] = @getAnimation height, width, @gfx.fireRun, 0

		getAnimation: (height, width, img, ySlot) ->
			anim = new Animation
			anim.createFromSheet config.framesCount, config.frameDuration, img, width, height, ySlot

		updateDirection: ->
			x = @linearVelocity.x
			if Math.abs(x) > 0.3
				@state     = @states.WALKING
				@direction = if x > 0 then @directions.RIGHT else @directions.LEFT
			else
				@state = @states.STANDING

		shot: (game) ->
			missle = Math.random()

			dir    = if @direction is @directions.LEFT then -1 else 1
			offset = dir * (@halfWidth + config.projectile_margin)
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


		fire: (game) ->
			return if @isFiring

			@isFiring = true
			count = config.framesCount / 2
			that  = @
			interval = window.setInterval ->
				that.shot game
				count = count - 1
				if count is 0
					that.isFiring = false
					window.clearInterval interval

			, config.frameDuration


		jump: (game) ->
			if -0.01 < @linearVelocity.y < 0.01
				game.box.applyImpulseDegrees @id, 0, @jumpForce

		destructor: ->

		onHit: (game, entity) ->
			if entity.type is "destroy"
				console.log "hit"
				@hp = @hp - 1
				if @hp <= 0
					@killed = true
					@destructor()
