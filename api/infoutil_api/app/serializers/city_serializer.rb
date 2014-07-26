class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :state_id
  def id 
  	object._id.to_s
  end
  def state_id
  	object.state_id.to_s
  end
end
