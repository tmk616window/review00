class UsersController < ApplicationController
  
  def show
    @posts = Post.where(post_id: current_user.id)
    @user = User.find(params[:id])
    @chats = Chat.where(chat_post_id: current_user.id)
    @follow = Follow.new
    @follows = Follow.where(user_id: @user.id)
    @follow_user = @follows.find_by(follower_id: current_user.id)
    @follow_current_user = Follow.where(follower_id: @user.id)
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/tasks'
  end
  
  def room
    @chats = Chat.where(chat_post_id: current_user.id)
    @user = User.find_by(id: params[:id])
    @channel_room = Channel.where(task_id: @user.id).or(Channel.where(user_id: @user.id))
    @channels = Channel.all
  end
  
  def chats
    @chats = Chat.where(chat_post_id: current_user.id)
    
    @chats.each do |c|
      User.find_by(id: c.user_id)
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if  current_user.id != @user.id
      redirect_to root_url
    end
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
