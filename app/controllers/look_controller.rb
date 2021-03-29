class LookController < ApplicationController
	before_action :force_json, only: :look

	def index
	end

	def look
		@patients = User.where("(first_name = ? or last_name = ? or email = ?) and doctor = false and admin = false", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")
	end


	private

	def force_json
		request.format = :json
	end

end