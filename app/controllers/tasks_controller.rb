class TasksController < ApplicationController
    
    def index
        @tasklists = Task.all
    end
    
    def show
        @tasklists = Task.find(params[:id])
    end
    
    def new
        @message = Message.new
    end

    def create
        @tasklists = Task.new(tasklist_params)

        if @message.save
            flash[:success] = 'Message が正常に投稿されました'
            redirect_to @message
        else
            flash.now[:danger] = 'Message が投稿されませんでした'
            render :new
        end
    end

    def edit
        @tasklists = Task.find(params[:id])
    end

    def update
        def update
            @tasklists = Task.find(params[:id])
            if @tasklists.update(tasklist_params)
                flash[:success] = 'Task は正常に更新されました'
                redirect_to @tasklists
            else
                flash.now[:danger] = 'Task は更新されませんでした'
                render :edit
            end
        end
    end

    def destroy
        @tasklists = Task.find(params[:id])
        @tasklists.destroy
        flash[:success] = 'Task は正常に削除されました'
        edirect_to tasklists_url
    end
    
    private

  # Strong Parameter
    def tasklist_params
        params.require(:task).permit(:content)
    end
end