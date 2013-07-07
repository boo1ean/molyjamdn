 define ['dojo/keys'], (keys) ->
	 (im) ->
		 im.addKeyAction keys.LEFT_ARROW
		 im.addKeyAction keys.RIGHT_ARROW
		 im.addKeyAction keys.UP_ARROW
		 im.addKeyAction keys.DOWN_ARROW
		 im.addKeyAction keys.CTRL, true
