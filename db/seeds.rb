User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "#{first_name}.#{last_name}@yopmail.com"
	User.create(email: email, password: Faker::Internet.password,
description: Faker::Lorem.paragraph, first_name: first_name, last_name: last_name)
end

5.times do
	e = Event.new(start_date: Faker::Time.forward(days: 23).to_datetime,
		duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
		title: Faker::Book.title, description: Faker::Lorem.paragraph, price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
	until e.save
		e = Event.new(start_date: Faker::Time.forward(days: 23),
		duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
		title: Faker::Book.title, description: Faker::Lorem.paragraph, price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
	end
end

5.times do
	a = Attendance.new(user: User.all.sample, event: Event.all.sample)
	until a.save
		a = Attendance.new(user: User.all.sample, event: Event.all.sample)
	end
end
