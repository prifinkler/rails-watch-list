# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

require 'uri'
require 'net/http'
require 'json'
require 'dotenv'

Dotenv.load

puts "Cleaning up database..."
Bookmark.destroy_all
Movie.destroy_all
puts "Database cleaned"

base_url = URI("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&sort_by=popularity.desc&primary_release_date.gte=1980-01-01&primary_release_date.lte=1989-12-31&page=")

total_pages = 5

movies_to_create = []

(1..total_pages).each do |page|
  url = URI("#{base_url}#{page}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = "Bearer #{ENV['TMDB_KEY']}"

  response = http.request(request)
  movies_data = JSON.parse(response.body)['results']

  puts "Importing movies from page #{page}"
  movies_data.each do |movie_data|
    base_poster_url = "https://image.tmdb.org/t/p/original"
    movies_to_create << {
      title: movie_data['title'],
      overview: movie_data['overview'],
      poster_url: "#{base_poster_url}#{movie_data['backdrop_path']}",
      vote_average: movie_data['vote_average'],
      vote_count: movie_data['vote_count']
    }
  end
end

movies_to_create.sort_by! { |movie| movie[:title] }

movies_to_create.each do |movie_data|
  puts "Creating #{movie_data[:title]}"
  Movie.create(movie_data)
end

puts "Movies created"
