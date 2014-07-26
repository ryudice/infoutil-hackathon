class ReporteSerializer < ActiveModel::Serializer
  attributes :id, :zone, :location

	def id
	object.id.to_s
	end

	def location

		[ object.location[0].to_f, object.location[1].to_f]
	end

end
