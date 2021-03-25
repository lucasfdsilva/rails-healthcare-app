class ChangePrescriptionIdColumn < ActiveRecord::Migration[6.1]
  def change
  	change_column :prescriptions, :prescription_id, :serial
  end
end
