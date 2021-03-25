json.patients do
	json.array!(@patients) do |user|
		json.user_id user.id
		json.name "#{user.first_name} #{user.last_name} | #{user.email}"
		json.email user.email
	end
end