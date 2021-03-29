class FindController < ApplicationController
	before_action :force_json, only: :find

	def index
	end

	def find
		@doctors = User.where("(first_name ILIKE '%#{params[:q]}%' OR last_name ILIKE '%#{params[:q]}%' OR email ILIKE '%#{params[:q]}%') AND doctor = true")
	end


	private

	def force_json
		request.format = :json
	end

end