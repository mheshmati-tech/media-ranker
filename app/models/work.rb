class Work < ApplicationRecord

    validates :title, presence: true
    validates :creator, presence: true 
    validates :publication_year, presence: true, numericality: { only_integer: true }
    validates :description, presence: true 

    
end
