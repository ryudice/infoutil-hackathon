import Ember from 'ember';

var Router = Ember.Router.extend({
  location: ReportesENV.locationType
});

Router.map(function() {
	this.route('index',{ path : '/'});
});

export default Router;
