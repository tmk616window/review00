class LikesController < ApplicationController
    def create
    @like = Like.new(like_params)
    @like.save
    @task = Task.find_by(id: @like.task_id)
    @likes = Like.where(task_id: @like.task_id)
    @new_likes = Like.where(task_id: @task.id)
    @like_user = @new_likes.find_by(user_id: current_user.id)

    end
    
    def destroy
        @like = Like.find(params[:id])
        @task = Task.find_by(id: @like.task_id)
        @like.destroy
        @likes = Like.where(task_id: @like.task_id)
        
    end
    
    private
    
    def like_params
        params.require(:like).permit(:task_id,:user_id)
    end

end
