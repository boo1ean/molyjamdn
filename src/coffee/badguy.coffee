define [
	'dcl'
	'./monster'
	'./config'
	'frozen/plugins/loadImage!gfx/goodAnimated.png'
], (dcl, Monster, config, img) ->
	'use strict'
	dcl Monster,
		x: config.screen_center
		y: 50
		img: img
		halfWidth: 48
		halfHeight: 64
		id: 'badguy'
