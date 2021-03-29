class LookController < ApplicationController
	before_action :force_json, only: :look

	def index
	end

	def look
		@patients = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') and doctor = false AND admin = false")
	end


	private

	def force_json
		request.format = :json
	end

end