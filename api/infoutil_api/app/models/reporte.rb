require 'elasticsearch/model'

class Reporte
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  
  field :location, type: Array
  field :zone, type: String
  index({location: "2d"})

  belongs_to :estado

  belongs_to :user
  embeds_many :pictures

  settings do
  	mappings do
  		indexes :location, type: 'geo_point', as: 'reporte_location'
  	end
  end

  def as_indexed_json(options={})
    ReporteSerializer.new(self).as_json
  end

  # def to_indexed_json
  # 	{
  # 		id: self.id.to_s,

  # 		location: { 
  # 			lat: location[0],
  # 			long: location[1]
  # 		}

  # 	}.to_json

  # end

end
