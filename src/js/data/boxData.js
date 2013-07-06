define(['./utils/generator'], function(id) {
	return {
		"entities": [
			{
				"x": 1000,
				"y": 0,
				"halfWidth": 20,
				"halfHeight": 300,
				"staticBody": true,
				"zone": false,
				"type": "Rectangle",
				"id": id()
			},
			{
				"x": 0,
				"y": 400,
				"halfWidth": 1000,
				"halfHeight": 50,
				"staticBody": true,
				"zone": false,
				"type": "Rectangle",
				"id": id()
			},
			{
				"x": 0,
				"y": 0,
				"halfWidth": 1000,
				"halfHeight": 50,
				"staticBody": true,
				"zone": false,
				"type": "Rectangle",
				"id": id()
			}
		],

		"joints": [],
		"canvas": {
			"height": 600,
			"width": 800
		},

		"backImg": null
	}
});
