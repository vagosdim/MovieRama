require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it 'is valid with email and password' do
        user = User.create(email: 'user@movierama.com', password: 'password', password_confirmation: 'password')
        expect(user).to be_valid
    end

    it 'is invalid with password not matching confirmation' do
        user = User.create(email: '', password: 'password', password_confirmation: 'not matching password')
        expect(user).to_not be_valid
    end

    it 'is invalid with empty email' do
        user = User.create(email: '', password: 'password', password_confirmation: 'password')
        expect(user).to_not be_valid
    end

    it 'is invalid with empty password' do
        user = User.create(email: '', password: '', password_confirmation: '')
        expect(user).to_not be_valid
    end
  end

end