class HomepagesController < ApplicationController
    def index
        @works = Work.all
        @albums = Work.all.where category: "album"
        @books = Work.all.where category: "book"
        @movies = Work.all.where category: "movie"
    end
end
