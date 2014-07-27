class Asalto
  include Mongoid::Document
  field :descripcion, type: String
  field :longitude, type: String
  field :latitud , type: String
end
