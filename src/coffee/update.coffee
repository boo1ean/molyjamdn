define [
	'lodash'
	'./config'
], (_, config) ->
	(millis) ->
		_.each @movableScene, (entity, index) ->
			if entity.killed? and entity.killed
				@removeBody entity
				@movableScene.splice index, 1
		, @

		badguy = @entities.badguy
		# badguy.angle = 0
		badguy.updateAnimations millis

		box = @box

		_.each @updateQueue, (tweenObject, indx) ->
			return unless tweenObject?

			# console.log "indx",indx
			if tweenObject.updateFramesCount % 5 is 0
				# console.log "tweenObject.updateFramesCount",tweenObject.updateFramesCount
				box.applyImpulseDegrees tweenObject.id, tweenObject.degrees, tweenObject.power
			else if tweenObject.updateFramesCount <= 0 
				tweenObject.onFinish()
				# console.log @updateQueue
				@updateQueue.splice indx,1
				# debugger;
			tweenObject.updateFramesCount--
			# updateQueue.
		, @

		#move according to the camera

		if not @badguyPrevX?
			@badguyPrevX = badguy.x
		xMod = @badguyPrevX - badguy.x

		if badguy.x >  @width/config.scale - config.scroll_margin
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

		if badguy.x < config.scroll_margin
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

		# going Y

		if not @badguyPrevY?
			@badguyPrevY = badguy.y
		yMod = @badguyPrevY - badguy.y

		# console.log "@height",@height
		if badguy.y > @height/config.scale - config.scroll_margin
			#if xMod started to be positive that means we changed te direction and have to stop moving camera
			if yMod < 0
				badguy.y = @badguyPrevY
				box.setPosition "badguy", badguy.x, badguy.y
				@yOffset += yMod
				_.each @movableScene, (ent) -> 
					#move shape
					ent.y += yMod
					#move colliding box
					box.setPosition ent.id, ent.x, ent.y
			else
				yMod = 0

		if badguy.y < config.scroll_margin
			if yMod > 0
				badguy.y = @badguyPrevY
				box.setPosition "badguy", badguy.x, badguy.y
				@yOffset += yMod
				_.each @movableScene, (ent) -> 
					#move shape
					ent.y += yMod
					#move colliding box
					box.setPosition ent.id, ent.x, ent.y
			else
				yMod = 0
		@badguyPrevY = badguy.y
