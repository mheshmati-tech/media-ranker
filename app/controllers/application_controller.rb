class ApplicationController < ActionController::Base
    def look_up_user
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        else
            @user = nil 
        end
    end
    before_action :look_up_user

end
