# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
villes = ["Armentière", "Roubaix", "Calais", "Douais", "Montpelier","Marseille", "Lyon", "Poitier", "Strasbourg", "Creil", "Bordeaux", "Lille", "Amiens", "Rennes", "Nantes", "Tours", "Narbonnes", "Montroeil", "Sedan",
   "Arras", "Villeneuve d'ascq"]
User.delete_all
User.create!(
    username: 'guidev',
    email: 'dev.guillaumem59@gmail.com',
    password:"12345678",
    password_confirmation:"12345678",
    prenom: 'Guillaume',
    nom: 'Manier',
    comment: 'Administrator, developper',
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
end
