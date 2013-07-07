define ['./config', 'dojo/keys'], (config, keys) ->
	(im) ->
		if im.keyActions[keys.LEFT_ARROW].isPressed()
			@box.applyImpulseDegrees "badguy", 270, config.hero_speed

		if im.keyActions[keys.RIGHT_ARROW].isPressed()
			@box.applyImpulseDegrees "badguy", 90, config.hero_speed

		if im.keyActions[keys.UP_ARROW].getAmount() or im.keyActions[keys.SPACE].getAmount()
			@entities.badguy.jump @

		if im.keyActions[keys.CTRL].getAmount()
			@entities.badguy.fire @
