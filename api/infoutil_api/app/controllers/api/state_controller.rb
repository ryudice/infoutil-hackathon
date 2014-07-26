class Api::StateController < ApplicationController
	def index
		render json: State.all
	end
end
