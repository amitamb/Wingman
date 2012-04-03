# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

list1 = [ 'Freelance Jobs', 'Online Deals', 'Local Deals', 'Coupon Codes', 'Electronics Deals', 'New Jokes', 'Apartment Rentals',
         'Apartment Sales', 'Recipes', 'New Inventions', 'Home Improvement Tips', 'Startup Advice',  'Hot Startups',
         'Celebrity Gossip', 'Funny Videos', 'Astonishing Facts', 'Adventure', 'Political News', 'Education News', 'Dating', 'New Movies',
         'New Songs', 'Latest TV Shows', 'New Cars', 'Used Cars', 'New Appliances', 'Used Appliances', 'New Mobiles' ]
         
list = [ 'Freelance Jobs', 'Online Deals', 'Coupon Codes',
         'Apartment Rent/Sell', 'Twitter Trends', 'Inventions', 'Academic Papers',
         'Recipes', 'Astonishing Facts', 'Adventure', 'Political News', 'Dating', 'New Movies',
         'New Songs', 'Latest TV Shows', 'New Cars', 'Used Cars', 'New Appliances', 'Used Appliances',
         'Latest Gadgets', 'Hot Startups', 'Startup Advice' ]

list.each do |tag|
  ActsAsTaggableOn::Tag.find_or_create_by_name(:name => tag)
end
