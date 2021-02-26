# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
user = User.new(username: Faker::Twitter.screen_name, email:Faker::Internet.email, password: "password",
bio:Faker::TvShows::BojackHorseman.quote, first_name:Faker::Movies::LordOfTheRings.character, last_name:Faker::Creature::Animal.name)
user.save || next
end

20.times do
review = Review.new(content: Faker::TvShows::RickAndMorty.quote, rating: rand(3..5))
review.reviewer = User.all.sample
review.reviewee = User.all.sample
review.save || next
puts "#{review.reviewer.username} wrote #{review.content} to #{review.reviewee.username}"
end

puts "created #{User.count} users!"

# Creating several events

10.times do
  puts "creating a event"
  event = Event.new(
    title: Faker::Book.title,
    location: Faker::Address.state,
    time: rand(5.days).seconds.ago,
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
  5.times do
    booking = Booking.new(
      event: event,
      user: User.all.sample,
      spoon: rand(0..3),
      status: rand(0..2)
    )
    if booking.save
      puts "#{booking.user.username} requested a nap with #{booking.event.user.username}"
    end
  end
end
