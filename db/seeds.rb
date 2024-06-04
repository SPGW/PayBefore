

# also part of test
require "open-uri"
require 'faker'


puts 'Cleaning database, deleting users, events, donations and vaults...'
Event.destroy_all
Vault.destroy_all
Donation.destroy_all
User.destroy_all

puts 'Creating users'
saul = User.create(email: 'saul@gmail.com', password: 'password', first_name: 'Saul', last_name: 'Goldman-Webb', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
ayax = User.create(email: 'ayax@gmail.com', password: 'password', first_name: 'Ayax', last_name: 'Abreu Garcia', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')
shex = User.create(email: 'shex@gmail.com', password: 'password', first_name: 'Ezzeldin', last_name: 'Osman', profile_picture: 'https://as1.ftcdn.net/v2/jpg/04/00/78/46/1000_F_400784687_nevcbFY2grwEA3wdAu2asJvx1GLFg0EJ.jpg')


puts 'creating vaults'
  Vault.create(donation_amount: 0, current_amount_vault:0, name: "Housing")
  Vault.create(donation_amount: 0, current_amount_vault:0, name: "Medical")
  Vault.create(donation_amount: 0, current_amount_vault:0, name: "Education")

puts 'Creating events'
16.times do |d|
Event.create(goal_amount: rand(150..1000), current_amount: 0,
  picture: "https://images.adsttc.com/media/images/5b7c/2b69/f197/ccd0/fb00/0052/newsletter/MIRA_Superman_Hero_Courtesy_Studio_Gang_and_Binyan.tif.jpg?1534864224",
  description: Faker::Company.bs, location: Faker::Address.full_address, vault_id: rand(1..3), user_id: rand(1..3))
end

puts 'creating donations'
5.times do |d|
  Donation.create(user_id: rand(1..3), contribution: rand(10..50), event_id: rand(1..5), vault_id: rand(1..3))
end

puts 'Finished mate'
