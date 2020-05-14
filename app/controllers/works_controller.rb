class WorksController < ApplicationController
  def index
    @albums = Work.all.where category: "album"
    @books = Work.all.where category: "book"
    @movies = Work.all.where category: "movie"
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
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    elsif @work.update(work_params)
      redirect_to work_path(@work.id)
      return
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def work_params
    variable = params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
    variable[:category].downcase!
    return variable
  end
end
