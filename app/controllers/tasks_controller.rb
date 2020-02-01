class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = 'Tasak が正常に投稿されました'
        else
            flash.now[:dager] = 'Task が投稿されませんでした'
            render :new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    
end


#Strong Parameter
   def task_params
       params.require(:task).permit(:content)
   end