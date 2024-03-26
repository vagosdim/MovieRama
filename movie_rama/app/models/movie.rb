class Movie < ApplicationRecord
    belongs_to :user

    def has_been_voted?
        likes > 0 || hates > 0
    end
end
