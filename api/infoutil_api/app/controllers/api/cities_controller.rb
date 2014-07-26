class Api::CitiesController < ApplicationController
	def index 
		render json: City.where(state: params[:state_id])
	end
end
