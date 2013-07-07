define(['./utils/generator',
		'frozen/plugins/loadImage!gfx/cosmicShip.png'
		], function(id,cosmShip) {
	return {
		"cosmicShipEntity":
		{
			"x": 300,
			"y": 300,
			"type": "Rectangle",
			"id": "cosmicShip",
			"background": cosmShip,
		},
		"joints": [],
		"canvas": {
			"height": 600,
			"width": 1000
		},

		"backImg": null
	}
});
