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
			@fireInterval = window.setInterval ->
				that.fire that.game
			, 500

		startMonitoring: ->
			that = @
			@monitoringInterval = window.setInterval ->
				dist = distance {x:that.x, y:that.y},{x:that.badguy.x, y:that.badguy.y}
				# console.log "dist",dist
				if dist < 35
					if not that.fireInterval
						that.fireInterval = that.startFiring()
						that.startFollowing()
				else
					clearInterval that.fireInterval
					# console.log "intervalID deleted!",that.intervalID
					that.fireInterval = null
			, 1000

		startFollowing: ->
			that = @
			@followingInterval = window.setInterval ->
				degr = degreesFromCenter {x:that.x, y:that.y},{x:that.badguy.x, y:that.badguy.y}
				if degr > 180
					that.direction = that.directions.LEFT
				else
					that.direction = that.directions.RIGHT

				twee =
					id : that.id
					updateFramesCount: 20
					degrees: degr
					power: 10
					onFinish: ()->
						# place continuing here!
				that.game.updateQueue.push twee

				if Math.rand() * 5  is 0 
					that.jump that.game
			, 500

		# constructor: dcl.superCall (sup) ->
		# 	(id) ->
		# 		sup.apply @, arguments

		removeIntervals: ->
			clearInterval(@monitoringInterval)
			@monitoringInterval = null
			clearInterval(@followingInterval)
			@followingInterval = null
			clearInterval(@fireInterval)
			@fireInterval = null



