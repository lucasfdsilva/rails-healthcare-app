class ResultsController < ApplicationController
	def index
	end

	def results
		if params[:q].match(/\s/)
			@firstName = params[:q].to_s.split(' ').first
			@lastName = params[:q].to_s.split(' ').second

			@doctors = User.where("(first_name LIKE ? and last_name LIKE ? or email LIKE ?) and doctor LIKE true", "%" + @firstName + "%", "%" + @lastName + "%", "%" + params[:q] + "%")

			@users = User.where("(first_name LIKE ? and last_name LIKE ? or email LIKE ?) and doctor LIKE false", "%" + @firstName + "%", "%" + @lastName + "%", "%" + params[:q] + "%")

			@prescriptions = Prescription.where("title LIKE ?", "%" + params[:q] + "%")
		else
			@doctors = User.where("(first_name LIKE ? or last_name LIKE ? or email LIKE ?) and doctor LIKE true", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

			@users = User.where("(first_name LIKE ? or last_name LIKE ? or email LIKE ?) and doctor LIKE false", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

			@prescriptions = Prescription.where("title LIKE ?", "%" + params[:q] + "%")
		end
	end

end