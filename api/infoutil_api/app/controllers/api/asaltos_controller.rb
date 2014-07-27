class Api::AsaltosController < ApplicationController
	def index
		render json: Asalto.all
	end
end
