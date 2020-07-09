class ChatsController < ApplicationController
  before_action do
    if !@match = Match.find_by(matchee_id: current_user.id, status: "approved")
        @match = Match.find_by(matcher_id: current_user.id, status: "approved")
    end
  end

  def new 
    @chat = @match.chats.new
  end
  
  def create
    @chat = @match.chats.new(chat_params)
    if @chat.save
      redirect_to chats_path
    end
  end
  
  def show 
    @chats = @match.chats
    @chat = @match.chats.new
  end

  private
  def chat_params
    params.require(:chat).permit(:user_id, :body, :timestamp)
  end

end
