import Ember from "ember";

export default Ember.Controller.extend({
	user_photo:null,
	user_photo_change:function(){
		var self = this;

		if(this.get("session.isAuthenticated")===true){

			FB.getLoginStatus(function(fbResponse) {
				
				if (fbResponse.status === 'connected'){
					FB.api("/me/picture",function(response){
					if(response&&response.data){
                      self.set("user_photo",response.data.url);
						}
                    });
				}else{
					console.log(self.get('session'));
					self.get('session').invalidateSession();
				}
				
			});
		
		}

	}.observes('session.isAuthenticated').on('init')
});