class FindController < ApplicationController
	before_action :force_json, only: :find

	def index
	end

	def find
		@doctors = User.where("first_name = ?", "%" + params[:q] + "%")
	end


	private

	def force_json
		request.format = :json
	end

end