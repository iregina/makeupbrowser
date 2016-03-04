# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ethnicity.create(name: "Asian")
Ethnicity.create(name: "White")
Ethnicity.create(name: "Black")
Ethnicity.create(name: "Alien")
Ethnicity.create(name: "Mix")
Ethnicity.create(name: "Other")

Occasion.create(name: "Evening")
Occasion.create(name: "Day")
Occasion.create(name: "Bridal")

Product.create(name: "MAC lipstick")
Product.create(name: "Naked Eye Shadow")
Product.create(name: "Liquid Liner")
