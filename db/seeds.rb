# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Game.destroy_all
Category.destroy_all
User.create(email: "test@test.com", password: "lalala",username: "testeur")
["Métier","Fruit","Légume","Pays","Ville","Capitale","Objet","Sport","Animal","Marque","Chanteur","Acteur","Couleur","Prénom"].each {|category|
    Category.create(name: category)
}
