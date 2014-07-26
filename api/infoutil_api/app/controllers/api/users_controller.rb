
class Api::UsersController < ApplicationController

	def create
		user = User.find_by(facebook_id: params[:facebook_id])

		if user.nil?
			user =  User.new(params.permit(:facebook_id, :name))

			if user.valid?
				user.save
				render json: user
			else
				render nothing: true, status: :bad_request
			end
			

		else
			render json: user

		end




	end

	def index
		render json: User.all 
	end

end
