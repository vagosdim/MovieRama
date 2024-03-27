class Reaction < ApplicationRecord

  belongs_to :user, class_name: 'User'
  belongs_to :movie, class_name: 'Movie'

  REACTION_TYPES = ["like", "hate"]
  validates :user_id, uniqueness: { scope: :movie_id }
  validates :movie_id, uniqueness: { scope: :user_id }
  validates :reaction_type, inclusion: { in: REACTION_TYPES}

end
