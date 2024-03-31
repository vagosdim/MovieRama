require 'rails_helper'

RSpec.describe ReactionsController, type: :controller do

    # Creates a valid user, and a valid movie that belongs to the user
    let (:user) {create(:user)}
    let (:movie) {create(:movie, user: user)}
    let(:valid_attributes) { { id: movie.id, reaction_type: 'like' } }

    describe 'POST #react' do
        it 'When user is logged in, the movie exists and does not belong to the logged in user, and reaction type is valid' do
            sign_in user

            post :react, params: { id: movie.id, reaction_type: 'like' }, format: :js#valid_attributes#{ movie_id: movie.id, reaction_type: ['like', 'hate'].sample }
            expect(response).to render_template('movies/_movie')
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'PATCH #reverse_reaction' do
        it '' do
        end
    end

    describe 'DELETE #undo_reaction' do
        it '' do
        end
    end
end