class CreatePrescriptionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.integer :prescription_id
      t.integer :doctor_id
      t.integer :user_id
      t.text :title
      t.text :description

      t.timestamps
    end
    add_index :prescriptions, :prescription_id
  end
end
