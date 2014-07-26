import Base from 'simple-auth/authenticators/base';
import Ember from 'ember';

export default Base.extend({
	restore: function(properties) {
		return new Ember.RSVP.Promise(function(resolve, reject) {
			if (!Ember.isEmpty(properties.accessToken)) {
				resolve(properties);
			} else {
				reject();
			}
		});
	},
	loginFb: function(resolve,reject){
		var self = this;
		FB.login(function(fbResponse) {
			console.log(fbResponse);
			if (fbResponse.authResponse) {

				FB.api('/me',function(response){
					var user=self.store.createRecord('user',{
						facebook_id : response.id,
						name : response.name
					});
					user.save();
					
				});

				Ember.run(function() {
					resolve({ accessToken: fbResponse.authResponse.accessToken });
				});
			} else {
				reject();
			}
		},{
			scope:'email',
			return_scopes :true
		});
	},
	authenticate: function() {
		var self = this;
		return new Ember.RSVP.Promise(function(resolve, reject) {

			FB.getLoginStatus(function(fbResponse) {

				if (fbResponse.status === 'connected') {
					Ember.run(function() {
						resolve({ accessToken: fbResponse.authResponse.accessToken });
					});
				} else if (fbResponse.status === 'not_authorized') {
					self.loginFb(resolve,reject);
				} else {
					self.loginFb(resolve,reject);
					
				}
			});
		});
	},
	invalidate: function() {
		return new Ember.RSVP.Promise(function(resolve) {
			FB.logout(function() {
				Ember.run(resolve);
			});
		});
	}
});