define(['./utils/generator',
		'frozen/plugins/loadImage!gfx/floor.png',
        'frozen/plugins/loadImage!gfx/floor2.png',
		'frozen/plugins/loadImage!gfx/floor_long.png',
    	'frozen/plugins/loadImage!gfx/decor.png',
		'frozen/plugins/loadImage!gfx/building1.png',
		'frozen/plugins/loadImage!gfx/stair.png',
        'frozen/plugins/loadImage!gfx/tree1.png'
	   ],
	 function(id, floor, floor2, floor_long, decor, building1, stair, tree1) {
return {
	 	"entities": [
        {
            "x": 800,
            "y": 600,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": floor_long
        },
        {
            "x": -480,
            "y": 270,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": floor
        },
//      stairway begin
        {
            "x": -290,
            "y": 283,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -250,
            "y": 303,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -210,
            "y": 323,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -170,
            "y": 343,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -130,
            "y": 363,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -90,
            "y": 383,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -50,
            "y": 403,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": -10,
            "y": 423,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 30,
            "y": 443,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 70,
            "y": 463,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 110,
            "y": 483,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 150,
            "y": 503,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 190,
            "y": 523,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 230,
            "y": 543,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
        {
            "x": 270,
            "y": 563,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": stair
        },
//      end stairway

        {
            "x": 1300,
            "y": 510,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 2,
            "id": id(),
            "background": decor
        },
        {
            "x": 1905,
            "y": 400,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "id": id(),
            "background": building1
        },

        {
            "x": -870,
            "y": 600,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": floor
        },
        {
            "x": -1150,
            "y": 500,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": floor2
        },
        {
            "x": -870,
            "y": 480,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 2,
            "id": id(),
            "background": tree1
        },
        {
            "x": -2200,
            "y": 400,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 5,
            "id": id(),
            "background": floor_long
        },
        {
            "x": -3300,
            "y": -900,
            "staticBody": true,
            "zone": false,
            "staticBody": true,
            "type": "Rectangle",
            "maskBits": 2,
            "id": "building",
            "background": building1
        },

		],
		"backImg": null
	} 
});
