define(['./utils/generator'], function(id) {
	return {
		"entities": [
			{
				"x": 0,
				"y": 0,
				"staticBody": true,
				"zone": false,
				"type": "Rectangle",
				"background": 'floor.png',
				"id": id()
			},
			{
				"x": 200,
				"y": 200,
				"staticBody": true,
				"zone": false,
				"type": "Rectangle",
				"background": 'bad.png',
				"id": id()
			},
			{
				"x": 400,
				"y": 400,
				"staticBody": true,
				"zone": false,
				"type": "Rectangle",
				"background": 'good.png',
				"id": id()
			}
		]
	}
});
