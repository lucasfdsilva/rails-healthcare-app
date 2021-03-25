class DropColumnPrescriptionId < ActiveRecord::Migration[6.1]
  def change
  	remove_column :prescriptions, :prescription_id
  end
end
