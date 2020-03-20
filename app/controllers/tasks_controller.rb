class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user
    def show
      @task = Task.find(params[:id])
    end
    
    def edit
      @task = Task.find(params[:id])
    end
    
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        flash[:success] = '正常に更新されました'
        redirect_to @task
      else
        flash.now[:danger] = '更新されませんでした'
        render :edit
      end
    end
    
    def create
      @task = current_user.tasks.build(task_params)
#      p 'ここを見ろ！'
#      p @task
      if @task.save# => レコードの作成
        flash[:success] = 'Task が正常に投稿されました'
        redirect_to root_path
      else
        flash.now[:danger] = 'Task が投稿されませんでした'
        render :new
      end
    end

    def destroy
#      p params
#      p 'ここを見ろ！'
#      p params[:id]
#      p params[:action]
      @task = Task.find(params[:id])
      @task.destroy
      flash[:success] = 'Task は正常に削除されました'
      redirect_to root_path
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