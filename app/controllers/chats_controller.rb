class ChatsController < ApplicationController


  
  def show
    @channel = Channel.find(params[:id])
    if  current_user.id != @channel.task_id || current_user.id != @channel.user_id
      redirect_to root_url
    end    
    @users = User.all
    @chatss = Chat.where(chat_id: params[:id])
    @chats = @chatss.where(user_id: @channel.task_id).or(@chatss.where(user_id: @channel.user_id))  
    @chat = Chat.new
    @user = User.find_by(id: current_user.id)
    gon.user_icon = @user.icon
    
    
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
  
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to root_url
  end
  
  def chat_params
    params.require(:chat).permit(:content,:user_id,:chat_id)
  end
end