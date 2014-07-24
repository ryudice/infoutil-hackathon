class User
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name, :facebook_id
  
  field :name, type: String
  field :facebook_id, type: String

  has_many :reportes


end
