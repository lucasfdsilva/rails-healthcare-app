class ResultsController < ApplicationController
	def index
	end

	def results
		if params[:q].match(/\s/)
			@firstName = params[:q].to_s.split(' ').first
			@lastName = params[:q].to_s.split(' ').second

			@doctors = User.where("(first_name = ? and last_name = ? or email = ?) and doctor = true", "%" + @firstName + "%", "%" + @lastName + "%", "%" + params[:q] + "%")

			@users = User.where("(first_name = ? and last_name = ? or email = ?) and doctor = false", "%" + @firstName + "%", "%" + @lastName + "%", "%" + params[:q] + "%")

			@prescriptions = Prescription.where("title = ?", "%" + params[:q] + "%")
		else
			@doctors = User.where("(first_name = ? or last_name = ? or email = ?) and doctor = true", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

			@users = User.where("(first_name = ? or last_name = ? or email = ?) and doctor = false", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")

			@prescriptions = Prescription.where("title = ?", "%" + params[:q] + "%")
		end
	end

end