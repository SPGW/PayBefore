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

users = [saul, ayax, shex]

puts 'creating vaults'
  vault_1 = Vault.create(donation_amount: 12500, current_amount_vault:6550, name: "Housing", description: "Our housing vault distributes donations to help people pay for household expenses, such as rent, utility bills and unexpected costs")
  vault_2 = Vault.create(donation_amount: 14500, current_amount_vault:7725, name: "Medical", description: "Our Medical vault collects and distributes donations to help people pay for unexpected medical expenses.")
  vault_3 = Vault.create(donation_amount: 12250, current_amount_vault:4610, name: "Education", description: "Our Education vault collects and distributes donations to help pay for education expenses, such as school fees, books and pens.")


#-----------------------------------------------------------------------------------EVENTS
puts 'Creating events'

cloudinaryPhoto1 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717615504/midjourney68_hospital_1_v6wb03.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
cloudinaryPhoto2 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717619363/midjourney68_hospital_3_uqedwh.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto2, filename: "nes.png", content_type: "image/png")
  event.save
end
cloudinaryPhoto3 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717619363/midjourney68_hospital_2_pnkwlv.png")
3.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto3, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto4 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_1_fxr4it.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto4, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto5 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_2_syq8zn.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto5, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto6 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_1_jlbtfv.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto6, filename: "nes.png", content_type: "image/png")
  event.save
end

cloudinaryPhoto7 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_2_zvqbse.png")
2.times do |d|
  event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: Faker::Company.bs, location: Faker::Address.full_address, vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto7, filename: "nes.png", content_type: "image/png")
  event.save
end


#-----------------------------------------------------------------------------------DONATIONS

# puts 'creating donations'
# 5.times do |d|
#   Donation.create(user: users.sample, contribution: rand(10..50), event_id: rand(1..5), vault_id: rand(1..3))
# end

puts 'Finished mate, well done buddy, until next time...'
