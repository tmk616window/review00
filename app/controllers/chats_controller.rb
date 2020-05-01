class ChatsController < ApplicationController
  def show
    @users = User.all
    @chats = Chat.all
    @chat = Chat.new
  end
  
  def create
    @chat = Chat.new(chat_params) 
    respond_to do |format| 
        @chat.save
        ActionCable.server.broadcast 'room_channel', content: @chat
        format.html { redirect_to @chat } 
        format.json { render :show, status: :created, location: @chat } 
        format.js 
    end 
  end
  
  def chat_params
    params.require(:chat).permit(:content,:user_id)
  end
end
