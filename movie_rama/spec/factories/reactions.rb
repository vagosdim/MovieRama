FactoryBot.define do
    factory :reaction do
      reaction_type { ['like', 'hate'].sample }
      association :user, factory: :user
      association :movie
    end
end
  