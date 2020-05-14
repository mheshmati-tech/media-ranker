class WorksController < ApplicationController
    def index
        @albums = Work.all.where category: "album"
        @books = Work.all.where category: "book"
        @movies = Work.all.where category: "movies"
    end

end
