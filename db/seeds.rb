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
olivia = User.create(email: 'olivia@gmail.com', password: 'password', first_name: 'Olivia', last_name: 'Goldman', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
seth = User.create(email: 'seth@gmail.com', password: 'password', first_name: 'Seth', last_name: 'de Jong', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
noah = User.create(email: 'noah@gmail.com', password: 'password', first_name: 'Noah', last_name: 'Wilde', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
joel = User.create(email: 'noah@gmail.com', password: 'password', first_name: 'Joel', last_name: 'Norton', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
maria = User.create(email: 'mariagg@gmail.com', password: 'password', first_name: 'Maria-Emma', last_name: 'Gordon', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
users = [olivia, seth, noah, joel, maria]

puts "creating admin users"
saul = User.create(email: 'saul@gmail.com', password: 'password', first_name: 'Saul', last_name: 'Goldman-Webb', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
ayax = User.create(email: 'ayax@gmail.com', password: 'password', first_name: 'Ayax', last_name: 'Abreu Garcia', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
shex = User.create(email: 'shex@gmail.com', password: 'password', first_name: 'Ezzeldin', last_name: 'Osman', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
User.create(email: 'test@test.com', password: 'password', first_name: 'test', last_name: 'test', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')

puts 'creating vaults'
  vault_1 = Vault.create(donation_amount: 12500, current_amount_vault:1550, name: "Housing",
    description: "The Housing vault distributes donations to help pay for urgent living expenses such as rent or utility bills (water, electricity or gas); as well as covering helping mitigate the high costs of house upkeeping (house renovations and long-term damage)")
  vault_2 = Vault.create(donation_amount: 14500, current_amount_vault:2725, name: "Medical",
    description: "The Medical vault distributes donations to help pay for unexpected medical expenses as well as helping people in need of paying high-cost medicine.")
  vault_3 = Vault.create(donation_amount: 12250, current_amount_vault:4610, name: "Education",
    description: "The Education vault distributes donations to help pay for education expenses, ranging from basic coverage items such books, pencils or pens, up to covering school fees.")

#-----------------------------------------------------------------------------------EVENTS
puts 'Creating events'

cloudinaryPhoto1 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717615504/midjourney68_hospital_1_v6wb03.png")
1.times do |d|
  event = Event.create(opening_date:"2024-06-30", name: "Need help paying for Diabetes pen", goal_amount: rand(800..1000), current_amount: rand(200..799),description: "The costs of using NovoLog PenFills increased tremendously and I am not always able to afford them", address: "Herderhof 2, Amsterdam", vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)
# cloudinaryPhoto2 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717619363/midjourney68_hospital_3_uqedwh.png")
# 1.times do |d|
#   event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
#   description: Faker::Company.bs, address: Faker::Address.full_address, vault: vault_2, user: users.sample)
#   event.photo.attach(io: cloudinaryPhoto2, filename: "nes.png", content_type: "image/png")
#   event.save
# end

# cloudinaryPhoto3 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717619363/midjourney68_hospital_2_pnkwlv.png")
# 1.times do |d|
#   event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
#   description: Faker::Company.bs, address: Faker::Address.full_address, vault: vault_2, user: users.sample)
#   event.photo.attach(io: cloudinaryPhoto3, filename: "nes.png", content_type: "image/png")
#   event.save
# end

cloudinaryPhoto4 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_1_fxr4it.png")
1.times do |d|
  event = Event.create(opening_date:"2024-06-28", name: "Rent period is overdue", goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: "I recently moved to Amsterdam and lost half my funds therefore unable to pay for rent for the rest of the year",
  address: "Chestertonlaan 115, Amsterdam", vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto4, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

# cloudinaryPhoto5 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_2_syq8zn.png")
# 1.times do |d|
#   event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
#   description: Faker::Company.bs, address: Faker::Address.full_address, vault: vault_1, user: users.sample)
#   event.photo.attach(io: cloudinaryPhoto5, filename: "nes.png", content_type: "image/png")
#   event.save
# end

cloudinaryPhoto6 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_1_jlbtfv.png")
1.times do |d|
  event = Event.create(opening_date:"2024-06-29", name: "Medical books for Summer 2024 period", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "I recently started Medical school at the VU Amsterdam and the cost of books is putting a lot of pressure on my semester budget",
  address: "Wallestein 34, Amsterdam", vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto6, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

# cloudinaryPhoto7 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_2_zvqbse.png")
# 1.times do |d|
#   event = Event.create(name: Faker::Quotes::Shakespeare.hamlet_quote, goal_amount: rand(800..1000), current_amount: rand(200..799),
#   description: Faker::Company.bs, address: Faker::Address.full_address, vault: vault_3, user: users.sample)
#   event.photo.attach(io: cloudinaryPhoto7, filename: "nes.png", content_type: "image/png")
#   event.save
# end


#-----------------------------------------------------------------------------------DONATIONS

# puts 'creating donations'
# 5.times do |d|
#   Donation.create(user: users.sample, contribution: rand(10..50), event_id: rand(1..5), vault_id: rand(1..3))
# end

puts 'Finished mate, well done buddy, until next time...'
