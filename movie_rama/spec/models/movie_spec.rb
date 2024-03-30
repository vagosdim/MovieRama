require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe 'validations' do
        it 'is valid with a title and user' do
            user = User.create(email: 'user@movierama.com', password: 'password')
            movie = Movie.new(title: 'Test Movie Title', user: user)
            expect(movie).to be_valid
        end

        it 'is invalid without a title' do
            user = User.create(email: 'user@movierama.com', password: 'password')
            movie = Movie.new(user: user)
            expect(movie).not_to be_valid
        end

        it 'is invalid without a user' do
            movie = Movie.new(title: 'Test Movie Title')
            expect(movie).not_to be_valid
        end
    end
end

