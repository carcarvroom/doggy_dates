class ApplicationController < ActionController::Base
    before_action :authorized, :set_current_user
    helper_method :current_user, :logged_in?

    def current_user
        @user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def set_current_user
        User.current = current_user
    end
    
    def logged_in?
        !current_user.nil?
    end

    def authorized
        flash[:message] = "Please sign up or login to view this content."
        redirect_to root_path unless logged_in?
    end

end
