json.doctors do
	json.array!(@doctors) do |user|
		json.user_id user.id
		json.name "#{user.first_name} #{user.last_name} | #{user.email}"
		json.email user.email
	end
end