 define ['dojo/keys'], (keys) ->
	 (im) ->
		 im.addKeyAction keys.LEFT_ARROW
		 im.addKeyAction keys.RIGHT_ARROW

		 # Jump
		 im.addKeyAction keys.UP_ARROW, true
		 im.addKeyAction keys.SPACE, true

		 # Fire
		 im.addKeyAction keys.CTRL, true
