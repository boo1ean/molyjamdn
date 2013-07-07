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

		# ResourceManager = require ('frozen/ResourceManager')
		# resourceManager = new ResourceManager
		# resourceManager.imageDir = 'gfx'


		game = new BoxGame
			canvasId: 'canvas',
			gameAreaId: 'gameArea',
			canvasPercentage: 0.95,
			loadingBackground: "black"
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

		_.each level1Data.entities, (entity) ->
			image = entity.background
			console.log "image just created! its width is ", image.width
			console.log "image is ", image
			game.addBody new SceneObject entity,image

		game.addBody guy

		#console.log level1Data.entities["sceneobject"]
		#sceneObj = new SceneObject level1Data.entities[0],floorImage
		game.run()
