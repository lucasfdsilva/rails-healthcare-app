class ResultsController < ApplicationController
	def index
	end

	def results
		if params[:q].match(/\s/)
			@firstName = params[:q].to_s.split(' ').first
			@lastName = params[:q].to_s.split(' ').second

			@doctors = User.where("(first_name ILIKE '%#{@firstName}%' AND last_name ILIKE '%#{@lastName}%' OR email ILIKE '%#{params[:q]}%') AND doctor = true")

			@users = User.where("(first_name ILIKE '%#{@firstName}%' AND last_name ILIKE '%#{@lastName}%' OR email ILIKE '%#{params[:q]}%') AND doctor = false AND admin = false")

			@admins = User.where("(first_name ILIKE '%#{@firstName}%' AND last_name ILIKE '%#{@lastName}%' OR email ILIKE '%#{params[:q]}%') AND admin = true")

			@prescriptions = Prescription.where("title = ?", "%" + params[:q] + "%")
		else
			@doctors = User.where("(first_name ILIKE '%#{params[:q]}%' OR last_name ILIKE '%#{params[:q]}%' OR email ILIKE '%#{params[:q]}%') AND doctor = true")

			@users = User.where("(first_name ILIKE '%#{params[:q]}%' OR last_name ILIKE '%#{params[:q]}%' OR email ILIKE '%#{params[:q]}%') AND doctor = false")

			@admins = User.where("(first_name ILIKE '%#{params[:q]}%' OR last_name ILIKE '%#{params[:q]}%' OR email ILIKE '%#{params[:q]}%') AND admin = true")

			@prescriptions = Prescription.where("title ILIKE '%#{params[:q]}%'")
		end
	end

	

end