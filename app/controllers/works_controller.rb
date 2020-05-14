class WorksController < ApplicationController
  def index
    @albums = Work.all.where category: "album"
    @books = Work.all.where category: "book"
    @movies = Work.all.where category: "movies"
  end

  def show
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    end
  end

  def new
    @work = Work.new
  end

  def create
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def update
  end

  def destroy
  end
end
