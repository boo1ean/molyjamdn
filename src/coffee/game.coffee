define [
	'./update'
	'./draw'
	'frozen/box2d/BoxGame'
	 'frozen/box2d/entities'
	'./boxData'
	'dojo/keys'
	'./staticobject'
	], (update, draw, BoxGame, entities, boxData, keys, StaticObject) ->
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
					this.box.applyImpulseDegrees "circle", 270, speed
				if im.keyActions[keys.RIGHT_ARROW].isPressed()
					this.box.applyImpulseDegrees "circle", 90, speed
				if im.keyActions[keys.UP_ARROW].isPressed()
					this.box.applyImpulseDegrees "circle", 0, speed

      	# circle = new entities["Rectangle"] x: 200,
		# y: 100,
		# halfWidth: 25,
		# halfHeight: 25,
		# staticBody: false,
		# fillStyle: "#55FF55",
		# id: "circle"
		
		circle = new entities["Rectangle"]
		circle.x = 200
		circle.y = 100
		circle.halfWidth = 25
		circle.halfHeight = 25
		circle.staticBody = false
		circle.fillStyle = "#55FF55"
		circle.id = "circle"

		rectangle = new entities["Rectangle"]
		rectangle.x = 348.5
		rectangle.y = 392
		rectangle.halfWidth = 317.5
		rectangle.halfHeight = 25
		rectangle.staticBody = true
		rectangle.zone = false

		game.addBody circle
		game.addBody rectangle

		game.run()