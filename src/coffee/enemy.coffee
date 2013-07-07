define [
  'dcl'
  './config'
  './monster'
  'frozen/plugins/loadImage!gfx/run.png'
  "frozen/utils/distance"
  "frozen/utils/degreesFromCenter"
], (dcl, config, Monster, img, distance, degreesFromCenter) ->
	'use strict'

	dcl [Monster],
		restitution: -5
		linearDamping: 0
		angularDamping: 10000
		staticBody: false
		halfWidth: 44
		halfHeight: 43
		intervalID: null
		gfx:
			run: img

		
		#constructor: (game) ->
			#@game = game
			# that = @
			# window.setInterval ->
			# 	that.fire game
			# , 1000
		startFiring: ->
			that = @
			@intervalID = window.setInterval ->
				that.fire that.game
			, 500

		startMonitoring: ->
			that = @
			window.setInterval ->
				dist = distance {x:that.x, y:that.y},{x:that.badguy.x, y:that.badguy.y}
				intervalID = 0
				# console.log "dist",dist
				if dist < 35
					if not that.intervalID
						that.intervalID = that.startFiring()
						# console.log "intervalID created!",@intervalID
						# degreesFromCenter(center, point)
						that.startFollowing()
				else
					clearInterval that.intervalID
					# console.log "intervalID deleted!",that.intervalID
					that.intervalID = null
			, 1000

		startFollowing: ->
			degr = degreesFromCenter {x:@x, y:@y},{x:@badguy.x, y:@badguy.y}
			# console.log "degr",degr
			that = @
			twee =
				id : that.id
				updateFramesCount: 100
				degrees: degr
				power: 10
				onFinish: ()->
					# place continuing here!
			@game.updateQueue.push twee
		

		# constructor: dcl.superCall (sup) ->
		# 	(id) ->
		# 		sup.apply @, arguments




