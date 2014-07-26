import Ember from 'ember';

export default Ember.View.extend({
	templateName : 'search-view',
	attributeBindings: ['style'],
	style:"padding-left:20px;",
	latLng : new google.maps.LatLng(13.694025, -88.857422),
	stateCb : Ember.A([]),
	selectedState : {
		id:null
	},
	cityCb : Ember.A([]),
	selectedCity:{
		id:null
	},
	placesServices : function(){
		if(this.get('map')){
			return new google.maps.places.PlacesService(this.get('map'));
		}
		return null;
	}.property('map'),
	changeSelectedState: function(){
		var self = this;
		this.get('store').find('city',{state_id:this.get('selectedState.id')}).then(function(data){
			self.set('cityCb',data.toArray());
		})
		
		//cityCb = this.get('store').find('city',{state_id:});
	}.observes('selectedState.id'),
	didInsertElement:function(){
		var self = this;

		this.get('map').controls[google.maps.ControlPosition.LEFT_BOTTOM].push(this.get("element"));

		this.get('store').find('state').then(function(data){
			self.set('stateCb',data.toArray());
		})

		this.$("button").click(function(){
			self.search();
		});
	},
	search:function(){
		
		var query = this.get('stateCb').filterBy('id',this.get('selectedState.id')).get('0.name')+","+this.get('cityCb').filterBy('id',this.get('selectedCity.id')).get('0.name')+","+"El Salvador";
	
		var request = {
			location :this.get("latLng"),
			radius : '1000',
			query : query
		};
		var self = this;
		this.get("placesServices").textSearch(request,function(result,status){
			if(result){
				self.get('map').panTo(result[0].geometry.location);
				self.get('map').setZoom(13);
			}
		});
	},
	map:null

});