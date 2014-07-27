import Ember from 'ember';

var Router = Ember.Router.extend({
  location: ReportesENV.locationType
});

Router.map(function() {
	this.route('index',{ path : '/'});
	this.route('reporte',{path : '/list'})
  this.route('asalto',{path:'/puntos/asaltos'});
});

export default Router;
