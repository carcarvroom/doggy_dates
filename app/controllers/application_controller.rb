class ApplicationController < ActionController::Base

    helper_method :logged_in?, :redirect_user, :current_user
    
    def current_user
        user = User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
    
    def redirect_user
        if !logged_in?
            flash[:message] = "Please login"
            redirect_to login_path
        end
    end

end
