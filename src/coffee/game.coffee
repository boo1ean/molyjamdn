define [
	'lodash'
	'./config'
	'./handle-input'
	'./init-input'
	'./update'
	'./draw'
	'./movie'
	'frozen/box2d/BoxGame'
	'frozen/box2d/entities'
	'./data/boxData'
	'./data/level1Data'
	'./monster'
	'./badguy'
	'./enemy'
	'./sceneobject'
	'./collisions-listener'
	], (_, config, handleInput, initInput, update, draw, movie, BoxGame, entities, boxData, level1Data, Monster, BadGuy, Enemy, SceneObject, contact) ->
		guy = new BadGuy

		window.config = config
		game = new BoxGame
			canvasId: 'canvas',
			gameAreaId: 'gameArea',
			canvasPercentage: 0.95,
			loadingBackground: "black"
			update: update,
			draw: draw,
			movie: movie,
			xOffset: -3150,
			yOffset: 0,
			movableScene: []
			initInput: initInput
			handleInput: handleInput
			updateQueue: []

		game.addBody guy

		_.each level1Data.entities, (entity) ->
			image = entity.background
			objectToAdd = new SceneObject entity,image
			game.addBody objectToAdd
			game.movableScene.push objectToAdd
			objectToAdd.initialX = objectToAdd.x

		enemy = new Enemy
		enemy.x = Math.random()*100
		enemy.y = Math.random()*100+300
		enemy.id = "enemy"
		enemy.game = game
		enemy.badguy = guy

		enemy.startMonitoring()
		# enemy.halfWidth = 44
		# enemy.halfHeight = 43
		# enemy.gfx.run = img
		game.movableScene.push enemy

		game.addBody enemy

		#game.movie()

		contact.game = game
		game.box.addContactListener contact

		game.run()
