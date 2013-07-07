define [
	'dcl'
	'./monster'
	'./config'
	'frozen/plugins/loadImage!gfx/run.png'
	'frozen/box2d/entities/Rectangle'
	'frozen/plugins/loadSound!sfx/plasmagun'
], (dcl, Monster, config, img, Rectangle, shotSound) ->
	'use strict'
	dcl Monster,
		x: config.screen_center
		y: 50
		halfWidth: 44
		halfHeight: 43
		id: 'badguy'
		gfx:
			run: img

		fire: (game) ->
			missle = Math.random()
			entity = new Rectangle
				id: missle
				x: @x * config.scale + @direction * (@halfWidth + config.projectile_margin)
				y: @y * config.scale
				type: "destroy"

			game.addBody entity

			angle = if @direction then 90 else 270
			game.box.applyImpulseDegrees missle, angle, config.projectile_speed
			shotSound.play()
			window.setTimeout ->
				game.removeBody entity
			, 300
