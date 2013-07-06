define([], function(){
	'use strict';
	return function(millis){
		this.entities.badguy.updateAnimations(millis);
	};
});
