class PatientsController < ApplicationController
  def index
    @user = User.where("doctor_id = ?", current_user.id)
  end
end
