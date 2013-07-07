define ['./config', 'dojo/keys'], (config, keys) ->
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
			guy = @entities.badguy
			missle = Math.random()
			entity = new entities.Rectangle
				id: missle
				x: guy.x * config.scale + guy.halfWidth + config.projectile_margin
				y: guy.y * config.scale
				type: "destroy"

			game.addBody entity

			@box.applyImpulseDegrees missle, 90, config.projectile_speed
			window.setTimeout ->
				game.removeBody entity
			, 300
