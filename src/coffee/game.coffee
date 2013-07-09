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

		_.each level1Data.entities, (entity) ->
			image = entity.background
			objectToAdd = new SceneObject entity,image
			game.addBody objectToAdd
			game.movableScene.push objectToAdd
			objectToAdd.initialX = objectToAdd.x
			# if (objectToAdd.id == "building")
				# console.log objectToAdd.halfWidth

		guy = new BadGuy
		game.addBody guy

		# enemy = new Enemy
		# enemy.x = Math.random()*100
		# enemy.y = Math.random()*100+300
		# enemy.id = "enemy"
		# enemy.game = game
		# enemy.badguy = guy

		# enemy.startMonitoring()
		# # enemy.halfWidth = 44
		# # enemy.halfHeight = 43
		# # enemy.gfx.run = img
		# game.movableScene.push enemy
		# game.addBody enemy



		#game.movie()

		# random building generator

		building = game.entities["building"]
		buildingWidth = 2225
		buildingHeight = 6100
		startingY = 400
		floorSpan = 250
		startingPosition = -4270 - buildingWidth / 2
		endingPosition = -4270 + buildingWidth / 2

		#make unpassable walls
		leftWall = new entities.Rectangle
		leftWall.halfWidth = 20
		leftWall.x = startingPosition + 20
		leftWall.y = -900
		leftWall.halfHeight = 3050
		leftWall.staticBody = true
		# leftWall.fillStyle = "green"
		leftWall.id = "leftBuildingWall"
		leftWall.maskBits = 5

		rightWall = new entities.Rectangle
		rightWall.halfWidth = 20
		rightWall.x = endingPosition - 20
		rightWall.halfHeight = 2000
		rightWall.y = -900 - buildingHeight / 2 + rightWall.halfHeight #with imaginary doors 
		rightWall.staticBody = true
		# rightWall.fillStyle = "green"
		rightWall.id = "rightBuildingWall"
		rightWall.maskBits = 5

		game.movableScene.push leftWall
		game.addBody leftWall

		game.movableScene.push rightWall
		game.addBody rightWall

		for i in [0..20]
			#decide how much columns will be made
			amount = Math.round(Math.random()) + 2
			coef1 = Math.random() * 0.6 + 0.2
			coef2 = 1 - coef1

			if amount is 3
				coef3 = Math.random() * 0.4 + 0.1
				coef1 -= coef3 / 2
				coef2 -= coef3 / 2

			#make some span between thems
			coefSpan = (Math.random() * 0.1 + 0.05) / 2
			coef1 -= coefSpan
			coef2 -= coefSpan

			if amount is 3
				coef3 -= coefSpan / 2

			makeEnemy = Math.round(Math.random() * 5) is 0

			platformHeight = Math.random() * 10 + 20

			#HACK for first platform to be the thinner that path leading to the building
			if i is 0
				platformHeight = 20

			rect1 = new entities.Rectangle
			rect1.halfWidth = buildingWidth * coef1 / 2
			# console.log "rec1width",rect1.halfWidth
			rect1.x = startingPosition + rect1.halfWidth
			rect1.y = startingY - i*floorSpan
			rect1.halfHeight = platformHeight
			rect1.staticBody = true
			rect1.fillStyle = "brown"
			rect1.id = "rect1_"+i


			rect2 = new entities.Rectangle
			rect2.halfWidth = buildingWidth * coef2 / 2
			rect2.x = endingPosition - rect2. halfWidth
			rect2.y = startingY - i*floorSpan
			rect2.halfHeight = platformHeight
			rect2.staticBody = true
			rect2.fillStyle = "yellow"
			rect2.id = "rect2_"+i

			if amount is 3
				rect3 = new entities.Rectangle
				rect3.halfWidth = buildingWidth * coef3 / 2
				# console.log "rec1width",rect1.halfWidth
				move3Coef = coef1 + coefSpan * 1.5
				rect3xTemp = startingPosition + (move3Coef * buildingWidth)
				rect3.x = rect3xTemp + rect3.halfWidth
				rect3.y = startingY - i*floorSpan
				rect3.halfHeight = platformHeight
				rect3.staticBody = true
				rect3.fillStyle = "blue"
				rect3.id = "rect3_"+i

			if (makeEnemy)
				console.log "enemy made on platform number ",i
				enemy = new Enemy
				enemy.x = rect1.x + 100
				enemy.y = startingY - i*floorSpan - 10
				enemy.id = "enemy_"+i
				enemy.game = game
				enemy.badguy = guy

				enemy.startMonitoring()
			
			game.addBody rect1
			game.movableScene.push rect1
			game.addBody rect2
			game.movableScene.push rect2

			if amount is 3
				game.addBody rect3
				game.movableScene.push rect3

			if makeEnemy
				game.addBody enemy
				game.movableScene.push enemy


			

		contact.game = game
		game.box.addContactListener contact

		game.run()
