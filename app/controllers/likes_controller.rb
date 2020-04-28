class LikesController < ApplicationController
    def create
    @like = Like.new(like_params)
    @like.save
    redirect_to task_path(@like.task_id)
    
    end
    
    def destroy
        @like = Like.find(params[:id])
        @task= Task.find_by(id: @like.user_id)
        @like.destroy
        redirect_to task_path(@task)
    end
    
    private
    
    def like_params
        params.require(:like).permit(:task_id,:user_id)
    end

end
