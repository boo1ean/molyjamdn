define(['./utils/generator',
		'frozen/plugins/loadImage!gfx/floor.png',
		'frozen/plugins/loadImage!gfx/bad.png'
	   ],
	 function(id,floor,bad) {
return {
	 	"entities": [
		{
			"x": 0,
			"y": 300,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor
		},
		{
			"x": 350,
			"y": 300,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor
		},
		{
			"x": 700,
			"y": 300,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor
		},		
		{
			"x": 1050,
			"y": 300,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor	
		},
		{
			"x": 1400,
			"y": 300,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor	
		},
		{
			"x": 1750,
			"y": 300,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor	
		},
		],
		"backImg": null
	} 
});
