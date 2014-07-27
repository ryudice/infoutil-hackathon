import Ember from 'ember';

export default Ember.Route.extend({

	model : function(){

		return this.store.find('reporte',{user_id:this.get("session.facebook_id")});
	}
});
