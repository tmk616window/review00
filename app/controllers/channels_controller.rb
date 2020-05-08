class ChannelsController < ApplicationController
    
    def show
        @channel = Channel.find(params[:id])
        if  current_user.id == @channel.task_id || current_user.id == @channel.user_id
        else
            redirect_to root_url
        end    
        @users = User.all
        @chatss = Chat.where(channel_id: @channel.id)
        @chats = @chatss.where(user_id: @channel.task_id).or(@chatss.where(user_id: @channel.user_id))  
        @chat = Chat.new
        @chat_user = @chatss.find_by(user_id: params[:user_id])
    end
    
    def create
        @channel = Channel.new(channel_params)
        @channel.save!
        redirect_to channel_url(@channel)
    end
    
    def destroy
        @channel = Channel.find(params[:id])
        @channel.destroy
        redirect_to root_url
    end

    private

    def channel_access
        if  current_user.id != @channel.task_id || current_user.id != @channel.user_id
        redirect_to root_url
        end    
    end
    
    
    def channel_params
        params.require(:channel).permit(:task_id,:user_id)
    end
    
end
