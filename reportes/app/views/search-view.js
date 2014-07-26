import Ember from 'ember';

export default Ember.View.extend({
	templateName : 'search-view',
	attributeBindings: ['style'],
	style:"padding-left:20px;",
	latLng : new google.maps.LatLng(13.694025, -88.857422),
	stateCb : Ember.A([]),
	selectedState : null,
	cityCb : Ember.A([]),
	selectedCity:null,
	placesServices : function(){
		if(this.get('map')){
			return new google.maps.places.PlacesService(this.get('map'));
		}
		return null;
	}.property('map'),
	didInsertElement:function(){
		var self = this;

		this.get('map').controls[google.maps.ControlPosition.LEFT_BOTTOM].push(this.get("element"));
		
		this.$('[name=departamento]').change(function() {
			
		});

		this.$("button").click(function(){
			self.search();
		});
	},
	search:function(){
		var query = Ember.$(this).val()+","+Ember.$(this).val()+","+"El Salvador";
		var request = {
			location :self.get("latLng"),
			radius : '1000',
			query : query
		};

		self.get("placesServices").textSearch(request,function(result,status){
			if(result){
				self.get('map').panTo(result[0].geometry.location);
				self.get('map').setZoom(13);
			}
		});
	},
	map:null

});