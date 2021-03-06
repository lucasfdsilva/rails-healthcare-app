json.doctors do
	json.array!(@doctors) do |user|
		json.user_id user.id
		json.name "#{user.first_name} #{user.last_name}"
		json.email user.email
	end
end

json.users do
	json.array!(@users) do |user|
		json.user_id user.id
		json.name "#{user.first_name} #{user.last_name}"
		json.email user.email
	end
end

json.admins do
	json.array!(@admins) do |admin|
		json.user_id admin.id
		json.name "#{admin.first_name} #{admin.last_name}"
		json.email admin.email
	end
end

json.prescriptions do
	json.array!(@prescriptions) do |prescription|
		@patient = User.where("id = ?", prescription.user_id)
		json.prescription_id prescription.id
		json.name "#{prescription.title}"
	end
end