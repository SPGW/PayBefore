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

cloudinaryPhoto1 = URI.open("https://media.istockphoto.com/id/1393991963/photo/obese-fat-man-preparing-semaglutide-ozempic-injection-control-blood-sugar-levels.jpg?s=612x612&w=0&k=20&c=l89QanAXiWiYUw-t7cITjTLpikaL1AlcwEE1eX_pMek=")
1.times do |d|
  event = Event.create!(opening_date:"2024-06-30", name: "Need help paying for Diabetes pen", goal_amount: rand(800..1000), current_amount: rand(200..799),description: "The costs of using NovoLog PenFills increased tremendously and I am not always able to afford them", address: "Herderhof 2, Amsterdam", vault: vault_2, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto2 = URI.open("https://plus.unsplash.com/premium_photo-1682284353484-4e16001c58eb?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
1.times do |d|
  event = Event.create!(opening_date:"2024-07-10", name: "Help me pay for my education", goal_amount: rand(800..1000), current_amount: rand(200..799),description: "Please help me pay for my education. I will be attending Le Wagon's coding bootcamp in july, and I need some help paying the tuition fee. All donations will go towards my education and so that I can become a programmer!", address: "IJsbaanpad 9, 1076 CV Amsterdam", vault: vault_3, user: users.sample)
  event.photo.attach(io: cloudinaryPhoto2, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryPhoto3 = URI.open("https://plus.unsplash.com/premium_photo-1677653126467-fb0fc59a9cde?q=80&w=2912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
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

cloudinaryPhoto6 = URI.open("https://images.unsplash.com/photo-1503676382389-4809596d5290?q=80&w=2976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
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
  event = Event.create!(opening_date:"2024-07-10", name: "Community Food Drive", goal_amount: rand(800..1000), current_amount: rand(200..799), description: "We are hosting a food drive in amsterdam on the 10th at Museumplein. Anyone can attend and we will be acceping donations online and in person! Bring any canned or nonperishable foods. ",
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

puts 'Creating completed events'

cloudinaryCompletePhoto1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/c1/Academisch_Medisch_Centrum_Amsterdam_001.jpg")
1.times do |d|
  event = Event.create!(opening_date:"2024-05-12", name: "Amsterdam Medical Fundraiser", goal_amount: 1000, current_amount: 1001, description: "The University Van Amsterdam's Mediacl Fundraiser has successfully reached its goal of €1,000.00. Thank you everyone who donated!  ",
  address: "Amsterdam Science Park 904, Amsterdam", vault: vault_2, user: olivia)
  event.photo.attach(io: cloudinaryCompletePhoto1, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryCompletePhoto2 = URI.open("https://images.unsplash.com/photo-1534483509719-3feaee7c30da?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
1.times do |d|
  event = Event.create!(opening_date:"2024-05-5", name: "Food Drive", goal_amount: 400, current_amount: 401, description: "The University Van Amsterdam's Food Drive Fundraiser has successfully reached its goal of €400.00. Thank you everyone who donated!  ",
  address: "Amsterdam Science Park 904, Amsterdam", vault: vault_1, user: seth)
  event.photo.attach(io: cloudinaryCompletePhoto2, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryCompletePhoto3 = URI.open("https://images.unsplash.com/photo-1519475889208-0968e5438f7d?q=80&w=2974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
1.times do |d|
  event = Event.create!(opening_date:"2024-05-22", name: "Amsterdam Housing Relief Program ", goal_amount: 2200, current_amount: 2201, description: "The University Van Amsterdam's Housing Relief Program has successfully reached its goal of €2,200.00. Thank you everyone who donated!  ",
  address: "Amsterdam Science Park 904, Amsterdam", vault: vault_1, user: noah)
  event.photo.attach(io: cloudinaryCompletePhoto3, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryCompletePhoto4 = URI.open("https://images.unsplash.com/photo-1582719471384-894fbb16e074?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
1.times do |d|
  event = Event.create!(opening_date:"2024-04-16", name: "Medical Bills Fundraiser", goal_amount: 800, current_amount: 801, description: "The University Van Amsterdam's Medical Fundraiser has successfully reached its goal of €800.00. Thank you everyone who donated!  ",
  address: "Amsterdam Science Park 904, Amsterdam", vault: vault_2, user: joel)
  event.photo.attach(io: cloudinaryCompletePhoto4, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryCompletePhoto5 = URI.open("https://stichtingorion-live-8da22ddc27e544289d3-e7384ba.divio-media.com/filer_public_thumbnails/filer_public/18/76/18766f48-15be-4c0e-90b5-a883ce361e6e/ps_van_det_2.png__1920x1000_subsampling-2.png")
1.times do |d|
  event = Event.create!(opening_date:"2024-04-25", name: "Van Detschool's Tuition Fundraiser", goal_amount: 1500, current_amount: 1501, description: "Van Detschool's Tuition Fundraiser has successfully reached its goal of €1,500.00. Thank you everyone who donated!  ",
  address: "IJsbaanpad 7, 1076 CV Amsterdam", vault: vault_3, user: maria)
  event.photo.attach(io: cloudinaryCompletePhoto5, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

cloudinaryCompletePhoto5 = URI.open("https://plus.unsplash.com/premium_photo-1686963590692-6ee248d29876?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
1.times do |d|
  event = Event.create!(opening_date:"2024-04-26", name: "School Supplies for my friend", goal_amount: 100, current_amount: 101, description: "My friend needed help paying for their children's school supplies. With your generous donations we were able to help them purchase all the supplies they needed. Thank you everyone who donated. ",
  address: "IJsbaanpad 7, 1076 CV Amsterdam", vault: vault_3, user: ayax)
  event.photo.attach(io: cloudinaryCompletePhoto5, filename: "nes.png", content_type: "image/png")
  event.save
end
sleep(1)

#-----------------------------------------------------------------------------------DONATIONS

# puts 'creating donations'
# 5.times do |d|
#   Donation.create(user: users.sample, contribution: rand(10..50), event_id: rand(1..5), vault_id: rand(1..3))
# end

puts 'Finished mate, well done buddy, until next time...'
