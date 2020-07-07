class ChatsController < ApplicationController


  def show 
    # need
  end

  def new 
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(params.require(:chat).permit(:timestamp))
  end

end

# user has access to chat_id (show page)
# if they they match relationship they have access to chat 
