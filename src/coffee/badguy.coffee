define [
	'dcl'
	'./monster'
	'frozen/plugins/loadImage!gfx/walking.png'
], (dcl, Monster, img) ->
	'use strict'
	dcl Monster,
		x: 170
		y: 50
		img: img
		id: 'badguy'
		direction: 0
