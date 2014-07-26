class Api::ReportesController < ApplicationController
	before_filter :find_user	

	def find_user
		@user = User.find(params[:user])
	end

	def index
		reportes = @user.reportes

		if params[:location]
			@user.reporte.geo_near([51.50998, -0.1337]).max_distance(100)
		end

		render json: @user.reportes

	end

	def create
		reporte = @user.reportes.new(params.require(:reporte).permit(:location,:zone))

		if reporte.valid?
			reporte.save
			render json: reporte
		end


	end

end
