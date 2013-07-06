define [
	'lodash'
	'./config'
	'./update'
	'./draw'
	'frozen/box2d/BoxGame'
	 'frozen/box2d/entities'
	'./data/boxData'
	'dojo/keys'
	'./monster'
	'./badguy'
	], (_, config, update, draw, BoxGame, entities, boxData, keys, Monster, BadGuy) ->
		guy = new BadGuy

		game = new BoxGame
			canvasId: 'canvas',
			gameAreaId: 'gameArea',
			canvasPercentage: 0.95,
			update: update,
			draw: draw,
			initInput: (im) ->
				im.addKeyAction keys.LEFT_ARROW
				im.addKeyAction keys.RIGHT_ARROW
				im.addKeyAction keys.UP_ARROW
				im.addKeyAction keys.DOWN_ARROW
				im.addKeyAction keys.CTRL, true
			,

			handleInput: (im) ->
				if im.keyActions[keys.LEFT_ARROW].isPressed()
					@box.applyImpulseDegrees "badguy", 270, config.hero_speed

				if im.keyActions[keys.RIGHT_ARROW].isPressed()
					@box.applyImpulseDegrees "badguy", 90, config.hero_speed

				if im.keyActions[keys.UP_ARROW].isPressed()
					@box.applyImpulseDegrees "badguy", 0, config.hero_speed

				if im.keyActions[keys.DOWN_ARROW].isPressed()
					@box.applyImpulseDegrees "badguy", 180, config.hero_speed

				if im.keyActions[keys.CTRL].getAmount()
					guy = game.entities.badguy
					missle = Math.random()
					game.addBody new entities.Rectangle
						id: missle
						x: guy.x * config.scale + guy.halfWidth + config.projectile_margin
						y: guy.y * config.scale

					@box.applyImpulseDegrees missle, 90, config.projectile_speed

		game.addBody guy

		boxData.entities.forEach (entity) ->
			if  entities[entity.type]
				game.addBody new entities[entity.type](entity)

		game.run()
