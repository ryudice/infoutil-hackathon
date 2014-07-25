import Ember from 'ember';

export default Ember.View.extend({
	templateName : 'search-view',
	attributeBindings: ['style'],
	style:"padding-left:20px;",
	didInsertElement:function(){
		var self = this;
		this.get('map').controls[google.maps.ControlPosition.LEFT_BOTTOM].push(this.get("element"));
		this.$('[name=departamento]').change(function(event) {
			var service = new google.maps.places.PlacesService(self.get('map'));
			var elSalvador = new google.maps.LatLng(13.694025, -88.857422);
			var query = $(this).val()+","+$(this).val()+","+"El Salvador";
			var request = {
				location :elSalvador,
				radius : '1000',
				query : query
			};

			service.textSearch(request,function(result,status){
				if(result){
					self.get('map').panTo(result[0].geometry.location);
					self.get('map').setZoom(13);
				}
			})
		});
	},
	
	map:null

});