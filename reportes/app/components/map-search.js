import Ember from 'ember';
import SearchView from 'reportes/views/search-view';
export default Ember.Component.extend({
	classNames:['map'],
	attributeBindings: ['style'],
	style:"height:550px;",
	didInsertElement:function(){
		var mapOptions = {
          center: new google.maps.LatLng(13.694025, -88.857422),
          zoom: 9,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          disableDefaultUI: true
        };
        var map = new google.maps.Map(this.$()[0],
            mapOptions);
        var view = SearchView.create({
         map :map
        })
        view.append();
           
	}
});