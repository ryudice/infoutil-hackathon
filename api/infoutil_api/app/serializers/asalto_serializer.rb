class AsaltoSerializer < ActiveModel::Serializer
  attributes :id,:location,:descripcion
  def id
  	object._id.to_s
  end
end
