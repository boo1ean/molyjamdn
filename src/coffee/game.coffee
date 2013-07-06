define [
	'./update'
	'./draw'
	'frozen/box2d/BoxGame'
	 'frozen/box2d/entities'
	'./boxData'
	'dojo/keys'
	], (update, draw, BoxGame, entities, boxData, keys) ->
		speed = 1

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
			,

			handleInput: (im) ->
				if im.keyActions[keys.LEFT_ARROW].isPressed()
					this.box.applyImpulseDegrees "player", 270, speed
				if im.keyActions[keys.RIGHT_ARROW].isPressed()
					this.box.applyImpulseDegrees "player", 90, speed
				if im.keyActions[keys.UP_ARROW].isPressed()
					this.box.applyImpulseDegrees "player", 0, speed


		boxData.entities.forEach (entity) ->
			if  entities[entity.type]
				game.addBody new entities[entity.type](entity)

		game.run()
