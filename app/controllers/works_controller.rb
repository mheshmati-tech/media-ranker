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
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    else
      @work.destroy
      redirect_to root_path
      return
    end
  end

  private

  def work_params
    user_input = params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
    user_input[:category].downcase!
    return user_input
  end
end
