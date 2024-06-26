require 'rails_helper'

RSpec.describe ReactionsController, type: :controller do

    # Creates a valid user, and a valid movie that belongs to the user
    let (:user) {create(:user)}
    let (:movie) {create(:movie, user: user)}
    
    # Create re-usable params
    let (:valid_attributes) {{ id: movie.id, reaction_type: 'like' }}
    let (:invalid_attributes) {{ id: movie.id, reaction_type: 'invalid string' }}

    describe 'POST #react' do
        it 'When user is logged in, the movie exists and does not belong to the logged in user, and reaction type is valid' do
            sign_in user

            post :react, params: valid_attributes, format: :js
            expect(response).to render_template('movies/_movie')
            expect(response).to have_http_status(:ok)
        end

        it 'When user is logged in, the movie exists and does not belong to the logged in user, and reaction type is valid' do
            sign_in user

            post :react, params: invalid_attributes, format: :js
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'When user is not signed in cannot react to movie --> unauthorized' do
            post :react, params: valid_attributes, format: :js
            expect(response).to have_http_status(:unauthorized)
        end

    end

    describe 'PATCH #reverse_reaction' do
        it 'reverse user reaction to movie with valid parameters' do
            sign_in user
            Reaction.create(user: user, movie: movie, reaction_type: 'hate')

            patch :reverse_reaction, params: valid_attributes, format: :js
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'DELETE #undo_reaction' do
        it 'delete reaction with valid parameters' do
            sign_in user
            Reaction.create(user: user, movie: movie, reaction_type: 'like')
            
            delete :undo_reaction, params: { id: movie.id }, format: :js
            expect(response).to have_http_status(:ok)
        end
    end
end