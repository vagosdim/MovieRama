# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
user1 = User.create(email: 'user1@movierama.com', password: 'password', password_confirmation: 'password')
user2 = User.create(email: 'user2@movierama.com', password: 'password', password_confirmation: 'password')
user3 = User.create(email: 'user3@movierama.com', password: 'password', password_confirmation: 'password')

# Create movies
current_datetime = Time.zone.now
movie1 = user1.movies.create(title: 'Movie 1', description: 'Movie 1 Description', upload_date: current_datetime)
movie2 = user1.movies.create(title: 'Movie 2', description: 'Movie 2 Description', upload_date: current_datetime + 10.minutes)
movie3 = user2.movies.create(title: 'Movie 3', description: 'Movie 3 Description', upload_date: current_datetime + 1.hours)
movie4 = user2.movies.create(title: 'Movie 4', description: 'Movie 4 Description', upload_date: current_datetime + 3.hours)
movie5 = user3.movies.create(title: 'Movie 5', description: 'Movie 5 Description', upload_date: current_datetime + 1.days)
movie6 = user3.movies.create(title: 'Movie 6', description: 'Movie 6 Description', upload_date: current_datetime + 2.days)

# Create Reactions
movie1.reactions.create(reaction_type: "like", user_id: user2.id)
movie1.reactions.create(reaction_type: "like", user_id: user3.id)
movie3.reactions.create(reaction_type: "like", user_id: user1.id)
movie3.reactions.create(reaction_type: "hate", user_id: user3.id)
movie4.reactions.create(reaction_type: "hate", user_id: user1.id)
movie4.reactions.create(reaction_type: "hate", user_id: user3.id)
movie5.reactions.create(reaction_type: "like", user_id: user1.id)
movie6.reactions.create(reaction_type: "hate", user_id: user2.id)