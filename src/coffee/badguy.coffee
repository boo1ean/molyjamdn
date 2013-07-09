define [
	'dcl'
	'./monster'
	'./config'
	'frozen/plugins/loadImage!gfx/run.png'
	'frozen/plugins/loadImage!gfx/stand.png'
	'frozen/plugins/loadImage!gfx/fire.png'
	'frozen/plugins/loadImage!gfx/fire-run.png'
], (dcl, Monster, config, run, stand, fire, fireRun) ->
	dcl Monster,
		x: config.screen_center
		y: 400
		halfWidth: 44
		halfHeight: 43
		id: 'badguy'
		maskBits: 5
		hp: 100
		fixedRotation: true
		gfx:
			run: run
			stand: stand
			fire: fire
			fireRun: fireRun

		anims:
			run: {}
			fire: {}
			jump: {}
			stand: {}
			fireRun: {}
