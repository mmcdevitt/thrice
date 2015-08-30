# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'mmcdevi1@gmail.com', password: 'koploplo', name: 'mmcdevi1')
User.create(email: 'mmcdevi2@gmail.com', password: 'koploplo', name: 'koplop')
User.create(email: 'mmcdevi3@gmail.com', password: 'koploplo', name: 'johnson')

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"