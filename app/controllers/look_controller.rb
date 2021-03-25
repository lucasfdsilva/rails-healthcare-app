class LookController < ApplicationController
	before_action :force_json, only: :look

	def index
	end

	def look
		@patients = User.where("(first_name LIKE ? or last_name LIKE ? or email LIKE ?) and doctor LIKE false and admin LIKE true", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")
	end


	private

	def force_json
		request.format = :json
	end

end