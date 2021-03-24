class DropTableDoctorsUsers < ActiveRecord::Migration[6.1]
  def change
  	drop_table :doctors_users
  end
end
