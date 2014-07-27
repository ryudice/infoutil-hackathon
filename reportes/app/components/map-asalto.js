import Ember from 'ember';

export default Ember.Component.extend({
	classNames:['map'],
	attributeBindings: ['style'],
	style:"height:550px;",
	map : null,
	statesData : null,
	didInsertElement:function(){
		var mapOptions = {
			center: new google.maps.LatLng(13.694025, -88.857422),
			zoom: 9,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true
		};
		this.set('map',new google.maps.Map(this.$()[0],mapOptions)) ;

	}
});