import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import Base from 'simple-auth/authenticators/base';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'reportes', // TODO: loaded via config
  Resolver: Resolver
});

var FbAuthenticator = Base.extend({
        restore: function(properties) {
          return new Ember.RSVP.Promise(function(resolve, reject) {
            if (!Ember.isEmpty(properties.accessToken)) {
              resolve(properties);
            } else {
              reject();
            }
          });
        },
        authenticate: function() {
          return new Ember.RSVP.Promise(function(resolve, reject) {

          	FB.getLoginStatus(function(fbResponse) {
        	
              if (fbResponse.status === 'connected') {
                Ember.run(function() {
                  resolve({ accessToken: fbResponse.authResponse.accessToken });
                });
              } else if (fbResponse.status === 'not_authorized') {
                FB.login(function(fbResponse) {
                  if (fbResponse.authResponse) {
                    Ember.run(function() {
                      resolve({ accessToken: fbResponse.authResponse.accessToken });
                    });
                  } else {
                    reject();
                  }
                });
              } else {
                FB.login(function(fbResponse) {
                  if (fbResponse.authResponse) {
                    Ember.run(function() {
                      resolve({ accessToken: fbResponse.authResponse.accessToken });
                    });
                  } else {
                    reject();
                  }
                });
              }
            });
          });
        },
        invalidate: function() {
          return new Ember.RSVP.Promise(function(resolve, reject) {
            FB.logout(function(response) {
              Ember.run(resolve);
            });
          });
        }
      });


Ember.Application.initializer({
        name: 'authentication',
        before: 'simple-auth',
        initialize: function(container, application) {
          // register the Facebook and Google+ authenticators so the session can find them
          container.register('authenticator:facebook', FbAuthenticator);
        }
      });


loadInitializers(App, 'reportes');

export default App;
