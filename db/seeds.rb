# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
File.open("#{Rails.root}/lib/seeds/villes.csv") do |lignes|
  lignes.read.each_line do |ville|
    departement, name, zipcode = ville.chomp.split(",")
    #  to remove the quotes from the csv text:
    #code.gsub!(/\A"|"\Z/, '')
    # to create each record in the database
    City.create!(:name => name.to_s, :departement => departement, :zip =>zipcode)
  end
end


villes = ["Armentière", "Quesnoy sur deule", "Roubaix", "Lincelles", "Tourcoing","Lomme", "Lambersart", "Pérenchies", "Saint André lez Lille", "Leers", "Wattrelos", "Lille", "Croix", "Mouvaux", "Halluin", "Roncq", "Wasquehal", "Lys les Lannoy", "Marcq-en-Baroeul",
   "Bondues", "Villeneuve d'ascq"]
categories = ["hypermarché", "supermarché", "proximité", "Drive", "bricolage", "ameublement", "jardinage"]
User.delete_all

10.times do |i|
  if i == 0
    adimage_src= File.join("public/img/default_pict/admin.jpeg")
    adsrc_file= File.new(adimage_src)
    User.create!(
        username: 'guidev',
        email: 'dev.guillaumem59@gmail.com',
        password:"12345678",
        password_confirmation:"12345678",
        prenom: 'Guillaume',
        nom: 'Manier',
        comment: 'Administrator, developper',
        city: 'Roubaix',
        avatar: adsrc_file,
        admin:true,
        subscribe:true
        )
  else
        usimage_src= File.join("public/img/default_pict/user#{i}.jpg")
        ussrc_file= File.new(usimage_src)
  User.create!(
      username: "toto#{i}",
      email: "toto#{i}@gmail.com",
      password:"12345678",
      password_confirmation:"12345678",
      prenom: "toto#{i}",
      nom: "Nom#{i}",
      comment: "Je suis toto#{i} et j'aime faire les courses",
      admin:false,
      avatar: ussrc_file,
      city: villes[i],
      subscribe:true
      )
      sleep 1
    end
end
Brand.delete_all
Brand.create!(
      name:"Carrefour",
      category:categories[0]
)
Brand.create!(
      name:"Auchan",
      category:categories[0]
)
Brand.create!(
      name:"Eleclerc",
      category:categories[0]
)
Brand.create!(
      name:"U",
      category:categories[0]
)
Brand.create!(
      name:"Carrefour Market",
      category:categories[1]
)
Brand.create!(
      name:"Carrefour City",
      category:categories[2]
)
Brand.create!(
      name:"Carrefour Contact",
      category:categories[2]
)
Brand.create!(
      name:"Carrefour Express",
      category:categories[2]
)
Brand.create!(
      name:"Carrefour Montagne",
      category:categories[2]
)
Brand.create!(
      name:"Carrefour Drive",
      category:categories[3]
)


# Get Brand ID
carrefour_id= Brand.where(name:"Carrefour").first.id
auchan_id= Brand.where(name:"Auchan").first.id
lecler_id= Brand.where(name:"Eleclerc").first.id
u_id= Brand.where(name:"U").first.id
carrefourmarket_id= Brand.where(name:"Carrefour Market").first.id
carrefourcity_id= Brand.where(name:"Carrefour City").first.id
carrefourcontact_id= Brand.where(name:"Carrefour Contact").first.id
carrefourmontagne_id= Brand.where(name:"Carrefour Montagne").first.id
carrefourexpress_id= Brand.where(name:"Carrefour Express").first.id
carrefourdrive_id= Brand.where(name:"Carrefour Drive").first.id


Shop.delete_all
require 'csv'


# Create Carrefour shops
File.open("#{Rails.root}/lib/seeds/Carrefourhdf.csv") do |shops|
  shops.read.each_line do |shop|
    name, city, zipcode, latitude, longitude = shop.chomp.split(";")
    #  to remove the quotes from the csv text:
    #code.gsub!(/\A"|"\Z/, '')
    # to create each record in the database
    Shop.create!(:zipcode => zipcode.to_s, :longitude => longitude, :latitude =>latitude, :brand_id => carrefour_id, :name => "Carrefour " + name)
    sleep 1
  end
end

# Create Carrefour shops
# File.open("#{Rails.root}/lib/seeds/Contact.csv") do |shops|
#   shops.read.each_line do |shop|
#     name, city, zipcode, latitude, longitude = shop.chomp.split(";")
#     #  to remove the quotes from the csv text:
#     #code.gsub!(/\A"|"\Z/, '')
#     # to create each record in the database
#     Shop.create!(:zipcode => zipcode.to_s, :longitude => longitude, :latitude =>latitude, :brand_id => carrefour_id, :name => "Carrefour " + name)
#     sleep 1
#   end
# end


#bids
6.times do |j|
  shopalea=rand(1..18)
  b=rand(1..10)
  a=rand(1..10)
  d=rand(1..10)
  e=rand(1..10)
  f=rand(1..10)

Bid.create!(
  shop_id: shopalea ,
  driver_id: b,


  pass1_id: a,
  pass2_id: e,
  pass3_id: d,
  pass4_id: f,
)
end
