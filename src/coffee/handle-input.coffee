define ['./config', 'dojo/keys', 'frozen/box2d/entities/Rectangle',
		'frozen/plugins/loadSound!sfx/plasmagun'], (config, keys, Rectangle,shotSound) ->
	(im) ->
		if im.keyActions[keys.LEFT_ARROW].isPressed()
			@box.applyImpulseDegrees "badguy", 270, config.hero_speed

		if im.keyActions[keys.RIGHT_ARROW].isPressed()
			@box.applyImpulseDegrees "badguy", 90, config.hero_speed

		if im.keyActions[keys.UP_ARROW].isPressed()
			@box.applyImpulseDegrees "badguy", 0, config.hero_speed

		if im.keyActions[keys.DOWN_ARROW].isPressed()
			@box.applyImpulseDegrees "badguy", 180, config.hero_speed

		if im.keyActions[keys.CTRL].getAmount()
			game = @
			guy = game.entities.badguy
			missle = Math.random()
			entity = new Rectangle
				id: missle
				x: guy.x * config.scale + guy.halfWidth + config.projectile_margin
				y: guy.y * config.scale
				type: "destroy"

			game.addBody entity
			shotSound.play();

			@box.applyImpulseDegrees missle, 90, config.projectile_speed
			window.setTimeout ->
				game.removeBody entity
			, 300
