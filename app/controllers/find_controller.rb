class FindController < ApplicationController
	before_action :force_json, only: :find

	def index
	end

	def find
		@doctors = User.where("(first_name = ? or last_name = ? or email = ?) and doctor = true", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

		@doctors = User.where("first_name SIMILAR TO " + params[:q])
	end


	private

	def force_json
		request.format = :json
	end

end