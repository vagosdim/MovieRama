require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'POST #create' do
        context 'with valid parameters'
            it 'Logged in user creates a new movie' do
            end
        end

        context 'with invalid parameters'
            it 'Logged in user does not creates a new movie due to missing params e.g., empty movie title' do
            end
        end
    end
end