class MainController < ApplicationController
	before_action :force_json, only: :search

	def index
	end

	def search
		@doctors = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') AND doctor = true")

		@users = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') AND doctor = false AND admin = false")

		@admins = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') AND admin = true")

		@prescriptions = Prescription.where("title LIKE '%#{params[:q]}%'")
	end

	private

	def force_json
		request.format = :json
	end

end