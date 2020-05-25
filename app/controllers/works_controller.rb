class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Work.all.where category: "album"
    @books = Work.all.where category: "book"
    @movies = Work.all.where category: "movie"
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "#{@work.title} successfully added :)"
      redirect_to work_path(@work.id)
      return
    else
      flash.now[:error] = "Something happened:( #{@work.title} was not added."
      render :new
      return
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      flash[:success] = "#{@work.title} successfully edited :)"
      redirect_to work_path(@work.id)
      return
    else
      render :edit
    end
  end

  def destroy
    votes = Vote.where(work_id: @work.id)
    votes.destroy_all
    @work.destroy
    flash[:success] = "#{@work.title} successfully deleted :)"
    redirect_to root_path
    return
  end

  private

  def find_work
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def work_params
    user_input = params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
    user_input[:category].downcase!
    return user_input
  end
end
