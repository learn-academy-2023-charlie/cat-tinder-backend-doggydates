# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
dogs = [
  {
    name: 'Scooby',
    age: 8,
    breed: 'Great Dane',
    sex: 'M',
    image: 'https://static.wikia.nocookie.net/p__/images/d/db/Scooby-Doo_transparent.png/revision/latest?cb=20200609210749&path-prefix=protagonist'
  },
  {
    name: 'Lady',
    age: 4,
    breed: 'Cocker Spaniel',
    sex: 'F',
    image: 'https://static.wikia.nocookie.net/disney/images/0/06/Profile_-_Lady.jpeg/revision/latest?cb=20190314123153'
  },
  {
    name: 'Pongo',
    age: 8,
    breed: 'Dalmation',
    sex: 'M',
    image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
  },
]

dogs.each do |each_dog|
  Dog.create each_dog
  puts "creating dog #{each_dog}"
end