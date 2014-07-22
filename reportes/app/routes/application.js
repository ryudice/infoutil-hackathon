import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';

export default  Em.Route.extend(ApplicationRouteMixin,{
	actions :{
		loginWithFacebook : function(){
			this.get('session').authenticate('authenticator:facebook',{});
		}
	}
});
