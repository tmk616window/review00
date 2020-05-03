class ChannelsController < ApplicationController
    def show
    end
    
    def create
    @channel = Channel.new(channel_params)
    @channel.save!
    redirect_to chat_path(@channel)
    end
    
    def channel_params
        params.require(:channel).permit(:task_id,:user_id)
    end
    
end
