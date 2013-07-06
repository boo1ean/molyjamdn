define [
	'lodash'
	'./config'
	'./update'
	'./draw'
	'frozen/box2d/BoxGame'
	'frozen/box2d/entities'
	'./data/boxData'
	'./data/level1Data'
	'dojo/keys'
	'./monster'
	'./badguy'
	'./sceneobject'
	'frozen/box2d/entities/Entity'
	], (_, config, update, draw, BoxGame, entities, boxData, level1Data, keys, Monster, BadGuy, SceneObject, Entity) ->
		speed = 3
		guy = new BadGuy

		ResourceManager = require ('frozen/ResourceManager')
		resourceManager = new ResourceManager
		resourceManager.imageDir = 'gfx'


		game = new BoxGame
			canvasId: 'canvas',
			gameAreaId: 'gameArea',
			canvasPercentage: 0.95,
			loadingBackground: "black"
			update: update,
			draw: draw,
			resourceManager: resourceManager,
			loadResources: (resourceManager) ->
				boxData.entities.forEach (entity) ->
					if entities[entity.type]
						game.addBody new entities[entity.type] entity 

				images = []
				level1Data.entities.forEach (entity) ->
					if entities[entity.type]
						background = entity.background
						images.push resourceManager.loadImage background

				# true until resourceManager.allLoaded
				console.log resourceManager.allLoaded

				console.log images
				images.forEach (image, index) ->
					game.addBody new SceneObject level1Data.entities[index],image
				console.log resourceManager.allLoaded


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

		#console.log level1Data.entities["sceneobject"]
		#sceneObj = new SceneObject level1Data.entities[0],floorImage

				


		game.run()
