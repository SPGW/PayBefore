# also part of test
require "open-uri"
require 'faker'


puts 'Cleaning database, deleting users, events, donations and vaults...'
Donation.delete_all
Event.delete_all
Vault.delete_all
User.delete_all


#-----------------------------------------------------------------------------------USERS
puts 'Creating users'
saul = User.create(email: 'saul@gmail.com', password: 'password', first_name: 'Saul', last_name: 'Goldman-Webb', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
ayax = User.create(email: 'ayax@gmail.com', password: 'password', first_name: 'Ayax', last_name: 'Abreu Garcia', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
shex = User.create(email: 'shex@gmail.com', password: 'password', first_name: 'Ezzeldin', last_name: 'Osman', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')


puts 'creating vaults'
  Vault.create(donation_amount: 12500, current_amount_vault:550, name: "Housing")
  Vault.create(donation_amount: 14500, current_amount_vault:725, name: "Medical")
  Vault.create(donation_amount: 12250, current_amount_vault:1610, name: "Education")


#-----------------------------------------------------------------------------------EVENTS
puts 'Creating events'

cloudinaryPhoto1 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717615504/midjourney68_hospital_1_v6wb03.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 2, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
cloudinaryPhoto2 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717619363/midjourney68_hospital_3_uqedwh.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 2, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto2, filename: "nes.png", content_type: "image/png")
  event.save
end
cloudinaryPhoto3 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717619363/midjourney68_hospital_2_pnkwlv.png")
3.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 2, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto3, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto4 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_1_fxr4it.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 1, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto4, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto5 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_2_syq8zn.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 1, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto5, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto6 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_1_jlbtfv.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 3, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto6, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto7 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_2_zvqbse.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(150..1000), current_amount: 0,
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: 3, user_id: rand(1..3))
  event.photo.attach(io: cloudinaryPhoto7, filename: "nes.png", content_type: "image/png")
  event.save
end


#-----------------------------------------------------------------------------------DONATIONS

puts 'creating donations'
5.times do |d|
  Donation.create(user_id: rand(1..3), contribution: rand(10..50), event_id: rand(1..5), vault_id: rand(1..3))
end

puts 'Finished mate, well done buddy, until next time...'
