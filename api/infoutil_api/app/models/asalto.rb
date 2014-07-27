class Asalto
  include Mongoid::Document
  field :descripcion, type: String
  field :location, type: Array
 # field :latitud , type: String


  index({location: "2d"})
end
	