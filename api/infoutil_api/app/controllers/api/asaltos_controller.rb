class Api::AsaltosController < ApplicationController
	def index

		# binding.pry
		if params[:location]
			location= params.permit(:location)[:location]
			coordinates = [ location.split(",")[0].to_f,  location.split(",")[1].to_f ]

			#binding.pry
			render json: { asaltos: ActiveModel::ArraySerializer.new(Asalto.geo_near(coordinates).max_distance(0.1), each_serializer: AsaltoSerializer)}
		else

			render json: Asalto.all

		end
	end

	def create

		asalto =  Asalto.new(params.permit(:descripcion, location:[]))

		if asalto.valid?
			asalto.save
			render json: asalto
		else
			render nothing: true, status: :bad_request
		end
	end
end
