import Ember from 'ember';

export default Ember.Component.extend({

	descripcion:"",
	map : null,
	statesData : null,
	didInsertElement:function(){
		var mapOptions = {
			center: new google.maps.LatLng(13.694025, -88.857422),
			zoom: 9,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true,
			disableDoubleClickZoom:true
		};
		this.set('map',new google.maps.Map(this.$('.map')[0],mapOptions)) ;
		var input = this.$('input')[0];
		this.get('map').controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		
		var autocomplete = new google.maps.places.Autocomplete(input);
		var self = this;

		google.maps.event.addListener(autocomplete, 'place_changed',function(){
			var place = autocomplete.getPlace();
			if (!place.geometry) {
				return;
			}

			if (place.geometry.viewport) {
				self.get('map').fitBounds(place.geometry.viewport);
			} else {
				self.get('map').setCenter(place.geometry.location);
				self.get('map').setZoom(15);  
			}
		});

		google.maps.event.addListener(this.get('map'),'dblclick',function(evt){

			self.set('lastLocation',[evt.latLng.k,evt.latLng.B]);
			self.$('.modal').modal('show');	
			
		})
	},
	modal:null,
	lastLocation:null,
	actions:{
		save : function(){
			console.log("save");
			var self = this;
			this.store.createRecord('asalto',{
				descripcion : this.get('descripcion'),
				location : this.get('lastLocation')

			}).save().then(function(){
				self.$('.modal').modal('hide');
			},function(){
				self.$('.modal').modal('hide');
			});
		}
	}
});
