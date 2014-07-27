import DS from 'ember-data';

export default DS.Model.extend({
  estado: DS.belongsTo('estado'),
  name: DS.attr(),
  localtion : DS.attr(),
  zone : DS.attr()
});
