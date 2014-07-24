import DS from "ember-data";

export default DS.Model.extend({
	name: DS.attr(),
	facebook_id: DS.attr()
});
