class TasksController < ApplicationController
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page]).per(2).order(id: "DESC")
  end

    
    
  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @user = User.all
    @like = Like.new
    @channels= Channel.new
    @likes = Like.where(task_id: params[:id])
    @like_user = @likes.find_by(user_id: current_user.id)
  end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to '/tasks'
    else
      render task_path(@task)
    end
  end
  
  def edit
    @task = Task.find(params[:id])

    if  current_user.id != @task.user_id
      redirect_to root_url
    end

  end
  
  def update
      @task = Task.find(params[:id])
    if @task.update!(task_params)
      redirect_to task_url(@task)
    else
      render "show"
    end

  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
     flash[:success] = '投稿しました'  
      redirect_to '/tasks'
    else
      render 'new'
    end
    
  end
  private
  
  def task_params
    params.require(:task).permit(:infra_point,:tasks_id,:user_id,:task_id,:task_user_email,:design,:design_point,:function,:function_point,:plan,:plam_point,:unique,:unique_point,:user_perspective,:user_perspective_point,:recruit,:field,:task_old,:task_pl,:task_tool,:github_url,:work_explain,:study_period,:task_coment,:company_info)
    
  end
end
