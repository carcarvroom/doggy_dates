class UsersController < ApplicationController

    private
    def user_params
        params.require(:user).permit(:name, :age, :location, :occupation, :username)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
