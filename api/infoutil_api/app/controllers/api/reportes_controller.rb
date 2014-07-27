class Api::ReportesController < ApplicationController
	before_filter :find_user	

	def find_user
		@user = User.find_by(facebook_id: params[:user_id])
	end

	def index
		

		render json: @user.reportes

	end

	def reporte_params

		params.permit(:lat,:long,:zone,:picture, :user_id)
	end

	def picture_params
		params.permit(:picture)
	end
	def create
		reporte = @user.reportes.new(zone: reporte_params[:zone], location: [ reporte_params[:lat].to_f, reporte_params[:long].to_f] )
		picture = Picture.new
		#binding.pry
		picture.picture = reporte_params[:picture]

		reporte.pictures << picture
		if reporte.valid?
			reporte.save
			render json: reporte
		else

			render nothing:true, status: :bad_request
		end


	end

end