define(['./utils/generator',
		'frozen/plugins/loadImage!gfx/floor.png',
	   ],
	 function(id,floor) {
return {
	 	"entities": [
		{
			"x": 0,
			"y": 500,
			"staticBody": true,
			"zone": true,
			"type": "Rectangle",
			"id": id(),
			"background": floor
		},
		{
			"x": 350,
			"y": 550,
			"staticBody": true,
			"zone": true,
			"type": "Rectangle",
			"id": id(),
			"background": floor
		},
		{
			"x": 700,
			"y": 500,
			"staticBody": true,
			"zone": false,
			"staticBody": true,
			"type": "Rectangle",
			"id": id(),
			"background": floor
		},		
		{
			"x": 1050,
			"y": 500,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor	
		},
		{
			"x": 1400,
			"y": 600,
			"staticBody": true,
			"zone": false,
			"type": "Rectangle",
			"id": id(),
			"background": floor	
		},
		{
			"x": 1750,
			"y": 650,
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
