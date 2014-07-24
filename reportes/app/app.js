import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

//import User from 'reportes/models/user';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'reportes', // TODO: loaded via config
  Resolver: Resolver
});




loadInitializers(App, 'reportes');

export default App;
