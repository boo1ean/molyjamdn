define [
	'dcl'
	'./monster'
	'./config'
	'frozen/plugins/loadImage!gfx/run.png'
	'frozen/plugins/loadImage!gfx/stand.png'
], (dcl, Monster, config, run, stand) ->
	'use strict'
	dcl Monster,
		x: config.screen_center
		y: 400
		points: [
    	{ x: 15, y: -20 },
    	{ x: 15, y: 2},
			{ x: 0, y: 30 },
			{ x: -15, y: 11 },
			{ x: -15, y: -20 }
		]
		halfWidth: 44
		halfHeight: 43
		id: 'badguy'
		fixedRotation: true
		gfx:
			run: run
			stand: stand
