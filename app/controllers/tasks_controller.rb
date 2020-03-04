    # Rubyメソッドを使用してSQLを操作する
    # Controller : HTTPリクエストの処理を担当; リクエストに対応した、Modelの取得・作成、保存
    # HTTPリクエスト　Router => Controller: アクション
    # View: Controller が、レスポンスとして返すWebページ; Controllerによって適切なModelがセットされる

class TasksController < ApplicationController
    #before_action :set_task, only: [:show, :edit, :update, :destroy]
    # before_action で実行するアクションを指定し、各アクションが実行される前に指定する事ができる
    
    def index
      @tasks = Task.all # .all => 全てのレコードを取得する
    end
    
    def show
      @task = Task.find(params[:id])# idを指定して検索
    end
    
    def new
      @task = Task.new # .new => 新規レコードのためのモデルインスタンスを作成する
    end

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

    def edit
      @task = Task.find(params[:id])
    end

      def update
        @task = Task.find(params[:id])
          if @task.update(task_params)
            flash[:success] = 'Task は正常に更新されました'
            redirect_to @task
          else
            flash.now[:danger] = 'Task は更新されませんでした'
            render :edit
          end
      end

    def destroy
        @tasks = Task.find(params[:id])
        @tasks.destroy
        flash[:success] = 'Task は正常に削除されました'
        redirect_to tasks_url
    end
    
    private
    
#    def message_params
#      params.require(:task).permit(:content, :status)
#    end

#    def set_task
#        @task = Task.find(params[:id])
#    end

  # Strong Parameter
    def task_params
        params.require(:task).permit(:content)
    end
end