# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'faker'

# Bookmark.destroy_all
# List.destroy_all
# Movie.destroy_all

# 50.times do
#   title = Faker::Movie.title
#   next if Movie.find_by(title:).present?

#   movie = Movie.new(
#     title:,
#     overview: Faker::Lorem.paragraph(sentence_count: 2),
#     poster_url: Faker::LoremFlickr.image(size: '300x450', search_terms: ['movie']),
#     rating: rand(1..10).round(1)
#   )
#   movie.save!
#   puts "Create #{movie.title}!"
# end



require 'open-uri'
require 'json'
puts 'cleaning database'
Movie.destroy_all
puts "creating movies"
url = URI.open("http://tmdb.lewagon.com/movie/top_rated?language=en-US&page=1").read
movies = JSON.parse(url)
movies["results"].take(20).each do |movie| #movies = JSON - "results" est la clé de l'API sur laquelle on veut aller chercher les résultats
  new_movie = Movie.new(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  )
  new_movie.save
end
puts "done"
