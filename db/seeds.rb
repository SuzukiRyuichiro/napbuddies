# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  user = User.new(username: Faker::Twitter.screen_name, email:Faker::Internet.email, password: Faker::Creature::Animal.name)
  user.save || next
end

puts "created #{User.count} users!"

# Creating several events

10.times do
  puts "creating a event"
  event = Event.new(
    title: Faker::Book.title,
    location: Faker::Address.full_address,
    time: rand(5.days).seconds.from_now,
    user: User.all.sample,
    max_guest: rand(2..3),
    description: Faker::Quote.yoda,
    host_spoon: rand(0..3)
    )
  if event.save
    puts "#{event.title} was created by #{event.user.username} @ #{event.location}"
  else
    next
  end
end

Event.all.each do |event|
  3.times do
    booking = Booking.new(
      event: event,
      user: User.all.sample,
      spoon: rand(0..3)
    )
    if booking.save
      puts "#{booking.user.username} requested a nap with #{booking.event.user.username}"
    end
  end
end
