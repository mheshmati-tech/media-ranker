class VotesController < ApplicationController
  def index
    # if params[:user_id]
    #   user = User.find_by(id: params[:user_id])
    #   @votes = user.votes
    # elsif params[:work_id]
    #   work = Work.find_by(id: params[:work_id])
    #   @votes = work.votes
    # end
  end

  def create
    if @logged_user
      @work = Work.find_by(id: params[:format])

      if @work.nil?
        flash.now[:error] = "Error! Unknown media."
      else
        @vote = Vote.new(work_id: @work.id, user_id: @logged_user.id)
        if Vote.all.any? { |vote| vote.work_id == @vote.work_id && vote.user_id == @vote.user_id }
          flash[:error] = "You have already upvoted this media. \n Unable to upvote media!"
        else
          if @vote.save
            flash[:success] = "Successfully upvoted!"
          else
            flash.now[:error] = "Something happened:( unable to upvote a media!"
          end
        end
      end
    else
      flash[:error] = "A problem occured: You must be log in to upvote!"
    end
    redirect_to works_path
  end
end
