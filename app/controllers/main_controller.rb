class MainController < ApplicationController
	before_action :force_json, only: :search

	def index
	end

	def search
		@doctors = User.where("first_name LIKE ? or last_name LIKE ? or email LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")
	end


	private

	def force_json
		request.format = :json
	end

end