class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user, :logged_in?

    def current_user
        User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !current_user.nil?
    end

    def authorized
        flash[:message] = "Please sign up or login to view this content."
        redirect_to root_path unless logged_in?
    end

end
