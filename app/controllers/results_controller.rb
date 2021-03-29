class ResultsController < ApplicationController
	def index
	end

	def results
		if params[:q].match(/\s/)
			@firstName = params[:q].to_s.split(' ').first
			@lastName = params[:q].to_s.split(' ').second

			@doctors = User.where("(first_name LIKE '%#{@firstName}%' AND last_name LIKE '%#{@lastName}%' OR email LIKE '%#{params[:q]}%') AND doctor = true")

			@users = User.where("(first_name LIKE '%#{@firstName}%' AND last_name LIKE '%#{@lastName}%' OR email LIKE '%#{params[:q]}%') AND doctor = false AND admin = false")

			@admins = User.where("(first_name LIKE '%#{@firstName}%' AND last_name LIKE '%#{@lastName}%' OR email LIKE '%#{params[:q]}%') AND admin = true")

			@prescriptions = Prescription.where("title = ?", "%" + params[:q] + "%")
		else
			@doctors = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') AND doctor = true")

			@users = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') AND doctor = false")

			@admins = User.where("(first_name LIKE '%#{params[:q]}%' OR last_name LIKE '%#{params[:q]}%' OR email LIKE '%#{params[:q]}%') AND admin = true")

			@prescriptions = Prescription.where("title LIKE '%#{params[:q]}%'")
		end
	end

	

end