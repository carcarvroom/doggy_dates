class LikesController < ApplicationController
    def index
        @user = User.find(current_user.id)
        @likes = @user.likes
    end

    def create
        liked_dog = params[:dog]
        @like = Like.new(user_id: current_user.id, dog_id: liked_dog)
        if @like.save
            owner_id = Dog.find_by(id: liked_dog).user_id
            if Match.where(matcher_id: owner_id, matchee_id: current_user.id, status: "pending").exists?
                match = Match.find_by(matcher_id: owner_id, matchee_id: current_user.id)
                match.update(status: "approved")
                new_chat = match.chats.create(user_id: current_user.id, timestamp: Time.now, body: "Hey! We matched!")
                flash[:match] = "You matched!"
                redirect_to matches_path
            else
                Match.create(matcher_id: current_user.id, matchee_id: owner_id)
                redirect_to '/dogs'
            end
        else
            flash[:error] = "You have already liked this dog!"
            redirect_to dog_path(liked_dog)
        end
    end

end