define [
	'dcl'
	'frozen/box2d/listeners/Contact'
	'./config'
], (dcl, Contact, config) ->
	contact = new Contact
	contact.postSolve = (a, b) ->
		return if not a? or not b?

		a = @game.entities[a]
		b = @game.entities[b]

		return if not a? or not b?

		if a.type is "destroy"
			if b.type is "monster"
				b.onHit @game

			@game.removeBody a

		if b.type is "destroy"
			if a.type is "monster"
				a.onHit @game

			@game.removeBody b

	contact
