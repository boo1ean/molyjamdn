define [
  'dcl'
  './config'
  './monster'
  'frozen/plugins/loadImage!gfx/run.png'
  "frozen/utils/distance"
], (dcl, config, Monster, img, distance) ->
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
				console.log "dist",dist
				if dist < 35
					if not @intervalID
						@intervalID = that.startFiring()
						console.log "intervalID created!",@intervalID
				else
					clearInterval @intervalID
					console.log "intervalID deleted!",@intervalID
					@intervalID = null
			, 1000

		# constructor: dcl.superCall (sup) ->
		# 	(id) ->
		# 		sup.apply @, arguments




