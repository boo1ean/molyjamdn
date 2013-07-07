define [
	'lodash'
	'./config'
	'./handle-input'
	'./init-input'
	'./update'
	'./draw'
	'frozen/box2d/BoxGame'
	'frozen/box2d/entities'
	'./data/boxData'
	'./data/level1Data'
	'./monster'
	'./badguy'
	'./enemy'
	'./sceneobject'
	], (_, config, handleInput, initInput, update, draw, BoxGame, entities, boxData, level1Data, Monster, BadGuy, Enemy, SceneObject) ->
		speed = 3
		guy = new BadGuy

		window.config = config
		game = new BoxGame
			canvasId: 'canvas',
			gameAreaId: 'gameArea',
			canvasPercentage: 0.95,
			loadingBackground: "black"
			update: update,
			draw: draw,
			xOffset: 0,
			yOffset: 0,
			movableScene: []
			initInput: initInput
			handleInput: handleInput

		game.addBody guy

		_.each level1Data.entities, (entity) ->
			image = entity.background
			objectToAdd = new SceneObject entity,image
			game.addBody objectToAdd
			game.movableScene.push objectToAdd
			objectToAdd.initialX = objectToAdd.x

		enemy = new Enemy
		enemy.x = Math.random()*100
		enemy.y = Math.random()*100
		enemy.id = "enemy"
		enemy.game = game
		enemy.badguy = guy

		enemy.startMonitoring()
		# enemy.halfWidth = 44
		# enemy.halfHeight = 43
		# enemy.gfx.run = img
		game.movableScene.push enemy

		game.addBody enemy

		Contact = require 'frozen/box2d/listeners/Contact'
		contact = new Contact
		contact.postSolve = (a, b) ->
			if a? and "destroy" and game.entities[a]? and "destroy" is game.entities[a].type
				game.removeBody game.entities[a]

			if b? and "destroy" and game.entities[b]? and "destroy" is game.entities[b].type
				game.removeBody game.entities[b]
		game.box.addContactListener contact
		game.run()