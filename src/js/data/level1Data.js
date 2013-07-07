define(['./utils/generator',
		'frozen/plugins/loadImage!gfx/floor.png',
		'frozen/plugins/loadImage!gfx/floor_long.png'
	   ],
	 function(id,floor, floor_long) {
return {
	 	"entities": [
        {
            "x": 800,
            "y": 600,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "id": id(),
            "background": floor_long
        },
        {
            "x": 800,
            "y": 600,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "id": id(),
            "background": floor_long
        },
        {
            "x": 800,
            "y": 600,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "id": id(),
            "background": floor_long
        },
		],
		"backImg": null
	} 
});
