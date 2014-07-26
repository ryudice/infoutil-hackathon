import FbAuthenticator from 'reportes/authenticators/facebook';

export default {
	name: 'authentication',
    before: 'simple-auth',
    initialize: function(container,application) {
          // register the Facebook  authenticator so the session can find them
          container.register('authenticator:facebook', FbAuthenticator);
          application.inject('authenticator:facebook','store','store:application');
          application.inject('component:map-search','store','store:application');
        }
};