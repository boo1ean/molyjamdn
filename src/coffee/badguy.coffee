define [
	'dcl'
	'./monster'
	'./config'
	'frozen/plugins/loadImage!gfx/run.png'
], (dcl, Monster, config, img) ->
	'use strict'
	dcl Monster,
		x: config.screen_center
		y: 50
		halfWidth: 44
		halfHeight: 43
		id: 'badguy'
		gfx:
			run: img
