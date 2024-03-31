require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'POST #create' do
        #context 'with valid parameters' do
            it 'creates a new movie' do
            user = User.create(email: 'user@movierama.com', password: 'password', password_confirmation: 'password')
            sign_in user # Assuming you're using Devise for authentication

            post :create, params: { movie: { title: 'The Shawshank Redemption' } }
            expect(response).to have_http_status(:redirect)
            #expect(Movie.count).to eq(1)
            expect(Movie.last.title).to eq('The Shawshank Redemption')
            end
        #end

        #context 'with invalid parameters' do
            it 'does not create a new movie' do
            user = User.create(email: 'user@movierama.com', password: 'password', password_confirmation: 'password')
            sign_in user

            post :create, params: { movie: { title: '' } }
            expect(response).to have_http_status(:unprocessable_entity) # Assuming you render the form again on failure
            #expect(Movie.count).to eq(0)
            end
        #end
    end

    describe 'GET #index' do
        it 'renders the index template' do
            get :index
            expect(response).to render_template('index')
        end
    end
end