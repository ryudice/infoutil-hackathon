import DS from "ember-data";

export default DS.RESTAdapter.extend({
	namespace:'api',
	createRecord : function(store,type,record){
		var data = {};
		var serializer = store.serializerFor(type.typeKey);
		serializer.serializeIntoHash(data,type,record,{ includeId : true });

		return this.ajax(this.buildURL(type.typeKey),"POST",{data:data[type.typeKey]});
	}
});