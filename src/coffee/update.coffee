define [
	'lodash'
	'./config'
], (_, config) ->
	(millis) ->
		badguy = @entities.badguy
		# badguy.angle = 0
		badguy.updateAnimations millis

		
		#move according to the camera
		box = @box
		# if badguy.x >= 40
		# xMod = badguy.x - 500/30
		if not @badguyPrevX?
			@badguyPrevX = badguy.x
		xMod = @badguyPrevX - badguy.x
		# oneMorePreviusX = _.clone @badguyPrevX
		# @badguyPrevX = badguy.x

		# console.log "xMod", xMod
		if badguy.x > 40
			#if xMod started to be positive that means we changed te direction and have to stop moving camera
			if xMod < 0
				badguy.x = @badguyPrevX
				box.setPosition "badguy", badguy.x, badguy.y
				@xOffset += xMod
				_.each @movableScene, (ent) -> 
					#move shape
					ent.x += xMod
					#move colliding box
					box.setPosition ent.id, ent.x, ent.y
			else
				xMod = 0

		if badguy.x < 5
			if xMod > 0
				badguy.x = @badguyPrevX
				box.setPosition "badguy", badguy.x, badguy.y
				@xOffset += xMod
				_.each @movableScene, (ent) -> 
					#move shape
					ent.x += xMod
					#move colliding box
					box.setPosition ent.id, ent.x, ent.y
			else
				xMod = 0

		@badguyPrevX = badguy.x