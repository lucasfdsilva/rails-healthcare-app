class MainController < ApplicationController
	before_action :force_json, only: :search

	def index
	end

	def search
		@doctors = User.where("(first_name = ? or last_name = ? or email = ?) and doctor = true", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

		@users = User.where("(first_name = ? or last_name = ? or email = ?) and doctor = false", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

		@prescriptions = Prescription.where("title = ?", "%" + params[:q] + "%")
	end

	private

	def force_json
		request.format = :json
	end

end