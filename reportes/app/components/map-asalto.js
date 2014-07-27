import Ember from 'ember';

export default Ember.Component.extend({

	descripcion:"",
	map : null,
	statesData : null,
	lastMarker : null,
	markers : Ember.A([]),
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
			self.deleteMarkers();

			if (!place.geometry) {
				return;
			}

			if (place.geometry.viewport) {
				self.get('map').fitBounds(place.geometry.viewport);
			} else {
				self.get('map').setCenter(place.geometry.location);
				self.get('map').setZoom(15);  

			}
			self.get('store').find('asalto',{location : place.geometry.location.k+","+place.geometry.location.B})

		});

		google.maps.event.addListener(this.get('map'),'dblclick',function(evt){

			self.set('lastLocation',[evt.latLng.k,evt.latLng.B]);
			self.$('.modal').modal('show');	
			self.set('lastMarker',new google.maps.Marker({
				position: evt.latLng,
				map: self.get('map'),
				title: ''
			}));

				
		});

		this.$(this.$('.modal')[0]).on('hidden.bs.modal', function (e) {
			if(!self.get('isSaved')){
			self.get('lastMarker').setMap(null);

			}else{
				self.get('lastMarker').descripcion = self.get('descripcion');

				var infowindow = new google.maps.InfoWindow({
				      content: self.get('descripcion')
				  });
				google.maps.event.addListener(self.get('lastMarker'),'click',function(evt){
					infowindow.open(self.get('map'),this);
				});
				self.get('markers').push(self.get('lastMarker'));
			}
			self.set('isSaved',false);



			});
	},
	modal:null,
	lastLocation:null,
	isSaved : false,
	deleteMarkers : function(){
		this.get('markers').forEach(function(mark){
			mark.setMap(null);
		});
	},
	actions:{
		save : function(){
			console.log("save");
			var self = this;
			this.store.createRecord('asalto',{
				descripcion : this.get('descripcion'),
				location : this.get('lastLocation')

			}).save().then(function(){
				self.set('isSaved',true);
				self.$('.modal').modal('hide');
			},function(){
				self.set('isSaved',false);

				self.$('.modal').modal('hide');
			});
		}
	}
});
