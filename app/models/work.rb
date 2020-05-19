# MOVIE = :movie 
# BOOK = :book
# ALBUM = :album


class Work < ApplicationRecord
    
   
    #from Devin 
    # @@valid_categories = [:album, :book, :movie]

    # def self.top_ten(category)
    #     if !@@valid_categories.include?(category)
    #         return throw an error 
    #     else 
    #         return #the top ten 
    #     end
    # end

    #from Leah 
    def self.albums
        return Work.where(category: 'album').sort_by { |album| album.votes.count }.reverse 
        #return Work.where(category: 'album').order( 'votes.count DESC' ) 
    end

    def self.books
        return Work.where(category: 'book').sort_by { |movie| movie.votes.count }.reverse
    end


    def self.movies
        return Work.where(category: 'movie').sort_by { |book| book.votes.count }.reverse
    end


    #https://apidock.com/rails/ActiveRecord/QueryMethods/order
    # def album_descending_order
    #     return Work.order(category: 'album'.arel_table['votes.count'].desc)
    # end

    validates :title, presence: true
    validates :creator, presence: true 
    validates :publication_year, numericality: { only_integer: true, greater_than: 1000 }
    validates :description, presence: true 

    has_many :votes


end
