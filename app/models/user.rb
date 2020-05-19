class User < ApplicationRecord
    has_many :votes

    def total_votes
        total = 0 

        self.votes.each do |vote|
            total += 1
        end
        return total 
    end
end
