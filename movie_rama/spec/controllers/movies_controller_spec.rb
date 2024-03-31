require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'POST #create' do
        context 'with valid parameters' do
            it 'creates a new movie' do
                user = User.create(email: 'user@movierama.com', password: 'password', password_confirmation: 'password')
                sign_in user # Assuming you're using Devise for authentication

                post :create, params: { movie: { title: 'The Shawshank Redemption' } }
                expect(response).to have_http_status(:redirect)
                expect(Movie.last.title).to eq('The Shawshank Redemption')
            end
        end

        context 'with invalid parameters' do
            it 'does not create a new movie' do
                user = User.create(email: 'user@movierama.com', password: 'password', password_confirmation: 'password')
                sign_in user

                post :create, params: { movie: { title: '' } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    describe 'GET #index' do
        it 'renders the index template' do
            get :index
            expect(response).to render_template('index')
        end

        it 'displays movies by descending creation date order' do
            movies = create_list(:movie, 5)
            get :index, params: { sort_by: 'date_desc' }
            expect(assigns(:movies)).to eq(movies.reverse)    
        end
    end
end