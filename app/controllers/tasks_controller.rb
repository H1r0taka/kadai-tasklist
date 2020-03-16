class TasksController < ApplicationController
    before_action :require_user_logged_in

    def create
      @task = Task.new(task_params)
      if @task.save# => レコードの作成
        flash[:success] = 'Task が正常に投稿されました'
        redirect_to @task
      else
        flash.now[:danger] = 'Task が投稿されませんでした'
        render :new
      end
    end

    def destroy
      @task.destroy
      flash[:success] = 'Task は正常に削除されました'
      redirect_to tasks_url
    end
    
    private
    
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content, :status)
    end
    
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end