# 80's Movies Mixtape

A Rails application for creating and managing movie watch lists, with a focus on 80's classics.

## Features

- Create custom movie lists
- Add movies to lists with comments
- View movie details including ratings and vote counts
- Delete movies from lists
- Responsive design with a retro 80's aesthetic

## Technical Details

- Built with Ruby on Rails
- Uses PostgreSQL database
- Integrates with The Movie Database (TMDB) API for movie data
- Implements Cloudinary for image upload and storage
- Styled with Bootstrap and custom CSS

## Setup

1. Clone the repository
2. Run `bundle install`
3. Set up the database with `rails db:create db:migrate db:seed`
4. Start the server with `rails server`

## Environment Variables

Make sure to set up the following environment variables:
- `CLOUDINARY_URL`: Your Cloudinary credentials
- `TMDB_KEY`: Your TMDB API key
