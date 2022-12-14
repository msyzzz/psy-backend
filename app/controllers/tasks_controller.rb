class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    # @user  = current_user
    render json: {error_code:0, data:Task.all, message:'ok'}, status: 200
  end

  def show
    render json: {error_code:0, data:@task, message:'ok'}, status: 200
  end

  def result
    @task = Task.find_by_id(params["id"])
    @count =  @task.finish
    @task.finish = @count + 1
    # save result
    @task.save
  end

  def dr_task_list
    @user = current_user
    render json: {error_code:0, data:@user.tasks, message:"ok"}, status: 200
  end

  def create
    @user = current_user
    # @doctor = @user.doctor
    @task = Task.new
    @task.name = task_params[:name]
    @task.testee_range = task_params[:testee_range]
    @task.deadline = task_params[:deadline]

    @questionnaire = Questionnaire.find_by_id(task_params[:questionnaire_id].to_i)
    @task.questionnaire_id = @questionnaire.id
    @task.name = @questionnaire.name
    @task.total = User.count
    @task.finish = 0
    # @task.doctor = @doctor
    # @users = User.where("department":@task.testee_range)
    # @task.users = @users
    if @task.save
      render json: {error_code:0, data:@task, message:'ok'}, status: 201
    else
      render json: {error_code:500, message:@task.errors}, status: 201
    end
  end

  def update
    if @task.update(task_params)
      render json: {error_code:0, data:@task, message:'ok'}, status: 202
    else
      render json: {error_code:500, message:@task.errors}, status: 202
    end
  end

  def destroy
    @task.destroy
    render json: {error_code:0, message:'ok'}, status: 204
  end

  private
  def task_params
    params.require(:task).permit(:testee_range, :questionnaire_id, :deadline)
  end

  def set_task
    @task = Task.find_by_id params[:id].to_i
    @task = @task || {}
  end
end
