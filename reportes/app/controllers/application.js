export default Ember.Controller.extend({
	user_photo:null,
	user_photo_change:function(){
		var self = this;

		if(this.get("session.isAuthenticated")){

			FB.getLoginStatus(function(fbResponse) {
				console.log(fbResponse);
				if (fbResponse.status === 'connected'){
					FB.api("/me/picture",function(response){
					if(response&&response.data)
                      self.set("user_photo",response.data.url);
                    });
				}
				
			});
		
		};

	}.observes('session.isAuthenticated').on('init')
});