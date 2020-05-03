class UsersController < ApplicationController
  
  def show
    @posts = Post.where(post_id: current_user.id)
    @user = User.find(params[:id])
    if  current_user.id != @user.id
      redirect_to root_url
    end
    @follow = Follow.new
    @follows = Follow.where(user_id: params[:id])
    @follow_user = @follows.find_by(follower_id: current_user.id)
    @follow_current_user = Follow.where(follower_id: @user.id)
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/tasks'
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end
      
    
  
  def user_params
    params.require(:user).permit(:user_id,:coment,:old,:programing_language,:job_past,:name,:icon)
  end
    
end
