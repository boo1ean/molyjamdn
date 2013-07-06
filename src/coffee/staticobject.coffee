define [
	'frozen/box2d/entities'
], (entities)->
	class StaticObject
		constructor: (entity)->
			@entity = new entities[entity.type] entity
			if entity.maskBits isnt 3 or 4		#let's assume that 3 and 4 are backgrounds
				console.log "WARNING: dynamic object is trying to be static with ID" + entity.id
