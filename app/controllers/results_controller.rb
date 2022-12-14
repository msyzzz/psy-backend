class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :update, :destroy]

  def index
    @user  = current_user
    render json: {error_code:0, data:@user.results, message:'ok'}, status: 200
  end

  def show
    render json: {error_code:0, data:@result, message:'ok'}, status: 200
  end

  def create
    @user = current_user
    @result = Result.new
    @result.user = @user
    @result.name = result_params["name"]
    @result.questionnaire_id = result_params["questionnaire_id"]
    @result.score = result_params["score"]
    @questionnaire = Questionnaire.find_by_id(@result.questionnaire_id)
    @score_range = @questionnaire.results
    @ss = JSON.parse(@score_range)
    p @ss
    @result.details = "轻度焦虑"

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
    params.require(:result).permit(:questionnaire_id, :score, :name)
  end

  def set_result
    @result = Result.find_by_id params[:id].to_i
    @result = @result || {}
  end
end
