class Estado
  include Mongoid::Document
  field :name, type: String
  has_many :reportes
end
