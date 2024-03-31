require 'faker'

FactoryBot.define do
    factory :movie do
      title { Faker::Movie.title }
      description { 'Example Movie Description'}
      created_at { Time.current }
      upload_date { Time.current }
      association :user, factory: :user
    end
end 