class ChatsController < ApplicationController
  before_action do
    if !@match = Match.find_by(matcher_id: current_user.id)
      @match = Match.find_by(matchee_id: current_user.id)

    end
  end
  
  def index
    @chats = @match.chats
    @chat = @match.chats.new
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
    # need
  end

  private
  def chat_params
    params.require(:chat).permit(:body)
  end

end

# user has access to chat_id (show page)
# if they they match relationship they have access to chat 
