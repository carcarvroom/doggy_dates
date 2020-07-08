class UsersController < ApplicationController
    # before_action :current_user, only: [:index, :show, :edit, :update, :destroy]
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    # add column for gender and image_url

    def index
        # if a user is not logged in, they shouldnt see the index
        @users = User.all
        helpers.logged_in?(@users)

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(params.require(:user).permit(:name, :age, :location, :occupation))
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user.delete
        redirect_to new_user_path # update to login page
    end

    private
    def user_params
        params.require(:user).permit(:name, :age, :location, :occupation, :username)
    end

    def find_user
        @user = User.find(params[:id])
    end
    
end
