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

Category.create(title: 'suits')
Category.create(title: 'shirts')
Category.create(title: 'pants')
Category.create(title: 'ties')
Category.create(title: 'shoes')
Category.create(title: 'accessories')

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

Listing.create(
  name: 'Lorem ipsum dolor sit amter ipsum dolor',
  description: 'Limited edition, only 150 pieces made. Tailored to 27" inseam for ankle length wear, slim tapered fit. Barely worn.
    Japanese 3×1 Denim(Recycled Fiber Weft / Midnight Grey Yarn Dye Warp) 
    95% Cotton ; 5% Recycled Fiber (Cotton,Acrylic, Poly) 
    11.5oz Yarn Dye Recycled Fiber Slub'
  price: '599.99',
  user_id: 1
  )
Listing.create(
  name: 'Lorem ipsum dolor sit amter ipsum dolor',
  description: 'Limited edition, only 150 pieces made. Tailored to 27" inseam for ankle length wear, slim tapered fit. Barely worn.
    Japanese 3×1 Denim(Recycled Fiber Weft / Midnight Grey Yarn Dye Warp) 
    95% Cotton ; 5% Recycled Fiber (Cotton,Acrylic, Poly) 
    11.5oz Yarn Dye Recycled Fiber Slub'
  price: '5499.99',
  user_id: 2
  )
Listing.create(
  name: 'Lorem ipsum dolor sit amter ipsum dolor',
  description: 'Limited edition, only 150 pieces made. Tailored to 27" inseam for ankle length wear, slim tapered fit. Barely worn.
    Japanese 3×1 Denim(Recycled Fiber Weft / Midnight Grey Yarn Dye Warp) 
    95% Cotton ; 5% Recycled Fiber (Cotton,Acrylic, Poly) 
    11.5oz Yarn Dye Recycled Fiber Slub'
  price: '399.99',
  user_id: 3
  )