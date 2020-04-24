class TasksController < ApplicationController
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end
  

    
  def new
    @task = Task.new
  end

  def show
    @user = User.all
    @task = Task.find(params[:id])
    @like = Like.new
    @likes = Like.where(task_id: params[:id])
    @like_user = @likes.find_by(user_id: current_user.id)
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to '/tasks'
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update!(task_params)
      redirect_to task_url(@task)
    else
      render 'edit'
    end
    
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to '/tasks'
    else
      render 'new'
    end
  end
  
  private
  
  
  def task_params
    params.require(:task).permit(:task_id,:task_user_email,:design,:design_point,:function,:function_point,:plan,:plam_point,:unique,:unique_point,:user_perspective,:user_perspective_point,:recruit,:field,:task_old,:task_pl,:task_tool,:github_url,:work_explain,:study_period,:task_coment,:company_info)
    
  end
end
