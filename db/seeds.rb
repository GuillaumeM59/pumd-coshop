# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
villes = ["Armentière", "Roubaix", "Calais", "Douais", "Montpellier","Marseille", "Lyon", "Poitier", "Strasbourg", "Creil", "Bordeaux", "Lille", "Amiens", "Rennes", "Nantes", "Tours", "Narbonnes", "Montroeil", "Sedan",
   "Arras", "Villeneuve d'ascq"]
categories = ["hypermarché", "supermarché", "proximité", "Drive", "bricolage", "ameublement", "jardinage"]
User.delete_all
User.create!(
    username: 'guidev',
    email: 'dev.guillaumem59@gmail.com',
    password:"12345678",
    password_confirmation:"12345678",
    prenom: 'Guillaume',
    nom: 'Manier',
    comment: 'Administrator, developper',
    city: 'Roubaix',
    admin:true,
    subscribe:true
    )
20.times do |i|
  User.create!(
      username: "toto#{i+1}",
      email: "toto#{i+1}@gmail.com",
      password:"12345678",
      password_confirmation:"12345678",
      prenom: "toto#{i+1}",
      nom: "Nom#{i+1}",
      comment: "Je suis toto#{i+1} et j'aime faire les courses",
      admin:false,
      city: villes[i],
      subscribe:true
      )
      sleep 1
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
carrefourcontact_id= Brand.where(name:"Carrefour Conatct").first.id
carrefourmontagne_id= Brand.where(name:"Carrefour Montagne").first.id
carrefourexpress_id= Brand.where(name:"Carrefour Express").first.id
carrefourdrive_id= Brand.where(name:"Carrefour Drive").first.id


Shop.delete_all
require 'csv'


# Create Carrefour shops
File.open("#{Rails.root}/lib/seeds/Carrefour.csv") do |shops|
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
File.open("#{Rails.root}/lib/seeds/Contact.csv") do |shops|
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
File.open("#{Rails.root}/lib/seeds/City.csv") do |shops|
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
File.open("#{Rails.root}/lib/seeds/Contact.csv") do |shops|
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
File.open("#{Rails.root}/lib/seeds/Contact.csv") do |shops|
  shops.read.each_line do |shop|
    name, city, zipcode, latitude, longitude = shop.chomp.split(";")
    #  to remove the quotes from the csv text:
    #code.gsub!(/\A"|"\Z/, '')
    # to create each record in the database
    Shop.create!(:zipcode => zipcode.to_s, :longitude => longitude, :latitude =>latitude, :brand_id => carrefour_id, :name => "Carrefour " + name)
    sleep 1
  end
end
