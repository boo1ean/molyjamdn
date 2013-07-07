define () ->
	(millis) ->
		badguy = @entities.badguy
		# badguy.angle = 0
		badguy.updateAnimations millis

		
		#move according to the camera
		box = @box
		# if badguy.x >= 40
		# xMod = badguy.x - 500/30
		if not @badguyPrevX?
			xMod = 0
		else
			xMod = badguy.x - @badguyPrevX
			badguy.x = @badguyPrevX
			box.setPosition "badguy", badguy.x, badguy.y
		@badguyPrevX = badguy.x;
		# console.log "xMod",xMod
		# console.log "badguyPrevX",@badguyPrevX
		_.each @movableScene, (ent) -> 
			#move shape
			ent.x -= xMod
			#move colliding box
			box.setPosition ent.id, ent.x, ent.y