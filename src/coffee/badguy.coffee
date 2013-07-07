define [
	'dcl'
	'./monster'
	'./config'
	'frozen/plugins/loadImage!gfx/run.png'
	'frozen/box2d/entities/Rectangle'
], (dcl, Monster, config, img, Rectangle) ->
	'use strict'
	dcl Monster,
		x: config.screen_center
		y: 400
		halfWidth: 44
		halfHeight: 43
		id: 'badguy'
		gfx:
			run: img
