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
olivia = User.create!(email: 'olivia@gmail.com', password: 'password', first_name: 'Olivia', last_name: 'Goldman', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
seth = User.create!(email: 'seth@gmail.com', password: 'password', first_name: 'Seth', last_name: 'de Jong', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
noah = User.create!(email: 'noah@gmail.com', password: 'password', first_name: 'Noah', last_name: 'Wilde', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
joel = User.create!(email: 'joel@gmail.com', password: 'password', first_name: 'Joel', last_name: 'Norton', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
maria = User.create!(email: 'mariagg@gmail.com', password: 'password', first_name: 'Maria-Emma', last_name: 'Gordon', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
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
  event = Event.create!(opening_date:"2024-06-30", name: "Need help paying for Diabetes pen", goal_amount: rand(800..1000), current_amount: rand(200..799),description: "The costs of using NovoLog PenFills increased tremendously and I am not always able to afford them", address: "Herderhof 2, Amsterdam", vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)
<<<<<<< homepageticker
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
=======

cloudinaryPhoto2 = URI.open("https://media.istockphoto.com/id/1409722748/photo/students-raising-hands-while-teacher-asking-them-questions-in-classroom.jpg?b=1&s=170667a&w=0&k=20&c=wmjzzESyHcSDFXYI1qzngse-EIj7aBMfebEaqjT8cjM=")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-10", name: "Help me pay for my education", goal_amount: rand(800..1000), current_amount: rand(200..799),description: "Please help me pay for my education. I will be attending Le Wagon's coding bootcamp in july, and I need some help paying the tuition fee. All donations will go towards my education and so that I can become a programmer!", address: "IJsbaanpad 9, 1076 CV Amsterdam", vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)
>>>>>>> master

cloudinaryPhoto3 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717621502/midjourney68_resi_1_fxr4it.png")
1.times do |d|
  event = Event.create!(opening_date:"2024-06-28", name: "Rent period is overdue", goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: "I recently moved to Amsterdam and lost half my funds therefore unable to pay for rent for the rest of the year",
  address: "Chestertonlaan 115, Amsterdam", vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto3, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto4 = URI.open("https://media.istockphoto.com/id/1146120013/photo/young-man-fixing-a-leak-under-the-bathroom-sink.jpg?s=612x612&w=0&k=20&c=_5OmB9-zzKEZLCKRQQpVgI353G2SnhjLhpikaMOUCZ0=")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-22", name: "My Boiler Broke", goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: "The boiler in my house recently broke and I have no hot water. I have 12 children and they need hot water to bathe. Please help me pay for a new boiler so that my children dont stink.",
  address: "Vondelpark, Amsterdam", vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto4, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto5 = URI.open("https://media.istockphoto.com/id/1165032242/photo/hispanic-girl-at-medical-appointment-with-a-broken-arm.jpg?s=612x612&w=0&k=20&c=36_gEv06d7q1aN-FTLKluT5wfzTIXVDcIgYcfrG4QCs=")
1.times do |d|
  event = Event.create!(opening_date:"2024-06-30", name: "My child has a broken arm", goal_amount: rand(800..1000), current_amount: rand(200..799),
  description: "My child has broken their arm and I can not afford the medical bills. Please help me pay for it. I am hosting a fundraising event on the 30th if anyone would like to attend. I am a single parent please please please help me and my child.",
  address: "De Boelelaan 1117, Amsterdam", vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto5, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto6 = URI.open("https://res.cloudinary.com/dz9wrleoq/image/upload/v1717622024/midjourney68_education_1_jlbtfv.png")
1.times do |d|
  event = Event.create!(opening_date:"2024-06-29", name: "Medical books for Summer 2024 period", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "I recently started Medical school at the VU Amsterdam and the cost of books is putting a lot of pressure on my semester budget",
  address: "Wallestein 34, Amsterdam", vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto6, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto7 = URI.open("https://media.istockphoto.com/id/1370552070/photo/portrait-of-a-young-woman-holding-her-hat-on-graduation-day.jpg?s=612x612&w=0&k=20&c=PzYNl41EcEVqw8TiyOpU18sYjcjdRMCGGkqsxX0Pc-g=")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-12", name: "University is expensive", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "My friend recently started university and the costs are adding up. There are many students that need help affording their education so I wanted to create a fundraising event for all of them. Our event will be on the 12th of july, and will be free to attend. If you want to donate on this page you can. All donations will go to Paybefore's Education Vault! ",
  address: "Amsterdam Science Park 904, Amsterdam", vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto7, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto8 = URI.open("https://media.ksdk.com/assets/KSDK/images/694f3133-d242-4be8-890c-8617038fe28e/694f3133-d242-4be8-890c-8617038fe28e_750x422.jpg")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-10", name: "Amsterdam Food Drive", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "We are hosting a food drive in amsterdam on the 10th at Museumplein. Anyone can attend and we will be acceping donations online and in person! Bring any canned or nonperishable foods. ",
  address: "Museumplein, Amsterdam", vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto8, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto9 = URI.open("https://www.team-gordon.com/wp-content/uploads/2016/07/block-party.jpg")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-10", name: "Neighborhood Block Party & Auction", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "Join us for a vibrant Neighborhood Block Party & Auction to support affordable housing initiatives! Enjoy a day filled with live music, local food trucks, games for kids, and a silent auction featuring donations from local businesses. All proceeds will go directly to helping families secure safe, stable homes within our community. Let’s come together to build a stronger, more supportive neighborhood!",
  address: "Vondelpark, Amsterdam", vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto9, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto10 = URI.open("https://images.saymedia-content.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTc0MTIzNDE5OTMwMjczMjI1/advice-for-organizing-a-fundraising-concert.jpg")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-10", name: "Homeless Shelter Benefit Concert", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "Experience an unforgettable night of music at the Homeless Shelter Benefit Concert! Enjoy performances from local bands and artists at our outdoor venue, with food and drink stalls adding to the festive atmosphere. All ticket sales and donations will support the expansion and operation of our local homeless shelter, providing a safe haven for those in need. Music has the power to bring us together—let’s use it to bring everyone home.",
  address: "Vondelpark, Amsterdam", vault: vault_1, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto10, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

#-----------------------------------------------------------------------------------COMPLEATED EVENTS

puts 'Creating compleated events'

cloudinaryPhoto11 = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/c1/Academisch_Medisch_Centrum_Amsterdam_001.jpg")
1.times do |d|
  event = Event.create!(opening_date:"2024-04-12", name: "Amsterdam Medical Fundraiser", goal_amount: 1000, current_amount: 1001, description: "The University Van Amsterdam's Mediacl Fundraiser has successfully reached its goal of €1,000.00. Thank you everyone who donated!  ",
  address: "Amsterdam Science Park 904, Amsterdam", vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto11, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

#-----------------------------------------------------------------------------------DONATIONS

# puts 'creating donations'
# 5.times do |d|
#   Donation.create(user: users.sample, contribution: rand(10..50), event_id: rand(1..5), vault_id: rand(1..3))
# end

puts 'Finished mate, well done buddy, until next time...'
