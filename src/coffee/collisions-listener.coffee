define [
	'dcl'
	'frozen/box2d/listeners/Contact'
	'./config'
], (dcl, Contact, config) ->
	contact = new Contact
	contact.postSolve = (a, b) ->
		#if a? and "destroy" and game.entities[a]? and "destroy" is game.entities[a].type
			#game.removeBody game.entities[a]

		#if b? and "destroy" and game.entities[b]? and "destroy" is game.entities[b].type
			#game.removeBody game.entities[b]

	contact
