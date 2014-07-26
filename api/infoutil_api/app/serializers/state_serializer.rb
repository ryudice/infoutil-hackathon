class StateSerializer < ActiveModel::Serializer
  attributes :id, :name
  def id 
  	object._id.to_s
  end
end
