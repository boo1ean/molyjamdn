define [
	'lodash'
	'./config'
	'./data/boxData'
	'./sceneobject'
], (_, config,boxData, SceneObject) ->
	->
		cosmicShip = new SceneObject boxData["cosmicShipEntity"], boxData["cosmicShipEntity"].background
		@addBody cosmicShip
		twee =
			id : cosmicShip.id
			updateFramesCount: 50
			degrees: 0
			power: 30
			onFinish: ()->
				# place continuing here!

		@updateQueue.push twee
