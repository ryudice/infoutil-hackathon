class UserSerializer < ActiveModel::Serializer
  attributes :id, :facebook_id, :name
  def id 
  	object._id.to_s
  end
end
