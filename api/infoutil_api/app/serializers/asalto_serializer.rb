class AsaltoSerializer < ActiveModel::Serializer
  attributes :id,:longitud,:latitud
  def id
  	object._id.to_s
  end
end
