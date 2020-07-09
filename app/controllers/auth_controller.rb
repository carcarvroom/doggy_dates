class AuthController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome]

    def create
        @user = User.find_by(username: params[:auth][:username])
        if @user && @user.authenticate(params[:auth][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = "Incorrect username and/or password. Please try again."
            render :new
        end
    end

    def destroy
        session.clear
        flash[:message] = "You have been logged out."
        redirect_to root_path
    end 

end