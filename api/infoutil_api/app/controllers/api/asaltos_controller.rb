class Api::AsaltosController < ApplicationController
	def index

		# binding.pry
		if params[:location]
			location= params.permit(:location)[:location]
			coordinates = [ location.split(",")[0].to_f,  location.split(",")[1].to_f ]

			
			render json: Asalto.geo_near(coordinates).max_distance(100).spherical
			
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
