import DS from 'ember-data';

var adapter = DS.RESTAdapter.extend({});
adapter.reopen({
 namespace : 'api',
 findQuery:function(store,type,query){
 	if(query.reporte_id){
 		return this.ajax("api/users/"+query.user_id+"/reportes/"+query.reporte_id,"GET");
 	}
 	else{
 		return this.ajax("api/users/"+query.user_id+"/reportes","GET");
 	}
 }
})
export default adapter;