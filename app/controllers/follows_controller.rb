class FollowsController < ApplicationController
    def create
        @follow = Follow.new(follow_params)
        @follow.save
        @user = User.find_by(id: @follow.user_id)
        @follow_current_user = Follow.where(follower_id: @user.id)
        @follow_follower_user = Follow.where(user_id: @user.id)
        @follows = Follow.where(user_id: @user.id)
        @follow_user = @follows.find_by(follower_id: current_user.id)
    end
    
    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        @user = User.find_by(id: @follow.user_id)
        @follow_current_user = Follow.where(follower_id: @user.id)
        @follow_follower_user = Follow.where(user_id: @user.id)
        @follows = Follow.where(user_id: @user.id)
        @follow_user = @follows.find_by(follower_id: current_user.id)
        
    end
    
    def follow_params
        params.require(:follow).permit(:user_id,:follower_id,:follow_user_email)
    end
    
end
