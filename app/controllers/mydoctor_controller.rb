class MydoctorController < ApplicationController
  def index
    @doctor = User.where("id = ?", current_user.doctor_id)

  end
end
