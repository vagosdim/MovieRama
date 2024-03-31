require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    user = User.create(email: 'user-test@movierama.com', password: 'password', password_confirmation: 'password')
    describe 'POST #create' do
        it 'creates a new movie, with valid parameters' do
            sign_in user # using devise

            post :create, params: { movie: { title: 'Test movie' } }
            expect(response).to have_http_status(:redirect)
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