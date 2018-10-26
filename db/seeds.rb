# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rental.destroy_all
Movie.destroy_all

filename = File.join Rails.root, "MovieGenre.csv"

movies = []

CSV.foreach(filename, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
    imdb_id    = row['imdb_id']
    imdb_link  = row['imdb_link']
    title      = row['title']
    imdb_score = row['imdb_score']
    genre      = row['genre']
    poster     = row['poster']

    movies = Movie.create!(imdb_id:    imdb_id,
                           imdb_link:  imdb_link,
                           title:      title,
                           imdb_score: imdb_score,
                           genre:      genre,
                           poster:     poster)                       
                          
    1.times do
        price          = Faker::Commerce.price(range = 0..10.0, as_string = true)
        stock_quantity = Faker::Number.number(2).to_i
        
        movies.storage.create(price:          price,
                              stock_quantity: stock_quantity)
    end                             
end 

1000.times do
    movies_all   = Movie.all.sample
    storages_all = Storage.all.sample

    rental_date = Faker::Date.between(3.year.ago, Date.today)

    rental = Rental.create(movie:       movies_all,
                           storage:     storages_all,
                           rental_date: rental_date)

    5.times do
        name      = Faker::Name.unique.name
        address   = Faker::Address.full_address
        phone_num = Faker::Base.numerify('#########')
        email     = Faker::Internet.safe_email

        rental.customer.create(name:      name,
                               address:   address,
                               phone_num: phone_num,
                               email:     email)
    end    
end    

puts "After seeding the database: "
puts "  - There are #{Movie.count} movies."
puts "  - There are #{Storage.count} storage."
puts "  - There are #{Rental.count} rental_info."
puts "  - There are #{Customer.count} customers."