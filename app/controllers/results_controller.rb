class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :update, :destroy]

  def index
    @user  = current_user
    render json: {error_code:0, data:@user.results, message:'ok'}, status: 200
  end

  def show
    render json: {error_code:0, data:@result, message:'ok'}, status: 200
  end

  def get_list
    @user = current_user
    render json: {error_code:0, data:user.Result, message:"ok"}, status: 200
  end

  def create
    @user = current_user
    @result = Result.new(result_params)
    @result.user = @user
    if @result.save && @user.save
      render json: {error_code:0, data:@result, message:'ok'}, status: 201
    else
      render json: {error_code:500, message:@result.errors}, status: 201
    end
  end

  def update
    if @result.update(result_params)
      render json: {error_code:0, data:@result, message:'ok'}, status: 202
    else
      render json: {error_code:500, message:@result.errors}, status: 202
    end
  end

  def destroy
    @result.destroy
    render json: {error_code:0, message:'ok'}, status: 204
  end

  private
  def result_params
    params.require(:result).permit(:questionnaire_id, :details)
  end

  def set_result
    @result = Result.find_by_id params[:id].to_i
    @result = @result || {}
  end
end
