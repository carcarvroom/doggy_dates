class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path
        else
            flash[:error] = @user.errors.full_messages
            render :new
        end
    end

    def update
        if @user.update(params.require(:user).permit(:name, :age, :location, :occupation))
            redirect_to @user
        else
            flash[:error] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user.delete
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :age, :location, :occupation, :username, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
