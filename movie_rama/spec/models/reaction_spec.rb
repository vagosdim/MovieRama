require 'rails_helper'

RSpec.describe Reaction, type: :model do
    describe 'validations' do
        it 'is valid with user, movie and reaction type' do
            user = User.create(email: 'user@movierama.com', password: 'password')
            movie = Movie.create(title: 'Test Movie Title', user: user)
            reaction = Reaction.create(user: user, movie: movie, reaction_type: ['like', 'hate'].sample)
            expect(reaction).to be_valid
        end

        it 'has invalid reaction type' do
            user = User.create(email: 'user@movierama.com', password: 'password')
            movie = Movie.create(title: 'Test Movie Title', user: user)
            reaction = Reaction.create(user: user, movie: movie, reaction_type: 'invalid reaction type')
            expect(reaction).not_to be_valid
        end

        it 'is invalid without a movie' do
            user = User.create(email: 'user@movierama.com', password: 'password')
            reaction = Reaction.create(user: user, reaction_type: ['like', 'hate'].sample)
            expect(reaction).not_to be_valid
        end
    end
end