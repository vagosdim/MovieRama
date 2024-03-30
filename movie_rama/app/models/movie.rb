class Movie < ApplicationRecord
    belongs_to :user
    has_many :reactions, dependent: :destroy
    validates :title, presence: true, uniqueness: true
    
    def has_been_voted?
        likes_count > 0 || hates_count > 0
    end

    def has_been_liked_by_user?(user_id)
        reactions.exists?(movie_id: self.id, user_id: user_id, reaction_type: 'like')
    end

    def has_been_hated_by_user?(user_id)
        reactions.exists?(movie_id: self.id, user_id: user_id, reaction_type: 'hate')
    end

    def likes_count
        reactions.count{ |reaction| reaction[:reaction_type] == "like"}
    end

    def hates_count
        reactions.count{ |reaction| reaction[:reaction_type] == "hate"}
    end
end
