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
User.create(email: "lala@lala.com", password: "lalala",username: "lalalala")
["métier","fruits ou légumes","Pays","ville","capitale","objet","sport","animal","marque","artiste musicale","couleur"].each {|category|
    Category.create(name: category)
    
}