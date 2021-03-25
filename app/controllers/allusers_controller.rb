class AllusersController < ApplicationController
  def index
  	@users = User.where("admin = false AND doctor = false")
  	@doctors = User.where("doctor = true")
  	@admins = User.where("admin = true")

  end
end
