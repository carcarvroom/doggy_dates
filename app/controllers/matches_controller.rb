class MatchesController < ApplicationController
  
  def index
    @matches = Match.my_matches
  end

  def show 
    @match = Match.find_by(matcher_id: current_user.id)
  end

  # def check
  #   byebug
  #   dog = params[:doggo]
  #   owner_id = Dog.find_by(id: dog).user_id
  #   if Match.where(matcher_id: owner_id, matchee_id: current_user.id, status: "pending").exists?
  #       match = Match.find_by(matcher_id: owner_id, matchee_id: current_user.id)
  #       match.update(status: "approved")
  #       new_chat = match.chats.create(user_id: current_user.id, timestamp: Time.now, body: "Hey! We matched!")
  #       flash[:match] = "You matched!!!"
  #       redirect_to chats_path
  #   else
  #       Match.create(matcher_id: current_user.id, matchee_id: owner_id)
  #       redirect_to dogs_path
  #   end
  # end

end
