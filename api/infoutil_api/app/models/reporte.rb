require 'elasticsearch/model'

class Reporte
  include Mongoid::Document
  include Elasticsearch::Model

  
  field :location, type: Array
  field :zone, type: String

  belongs_to :user
  embeds_many :pictures

end
