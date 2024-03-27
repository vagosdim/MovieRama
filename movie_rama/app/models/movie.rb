class Movie < ApplicationRecord
    belongs_to :user
    has_many :reactions
    
    def has_been_voted?
        likes > 0 || hates > 0
    end
end
