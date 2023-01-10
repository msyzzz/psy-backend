class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :update, :destroy]

  def index
    @qn  = Questionnaire.all
    render json: {error_code:0, data:@qn, message:'ok'}, status: 200
  end

  def show
    render json: {error_code:0, data:@questionnaire, message:'ok'}, status: 200
  end

  def create
    @user = current_user
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.doctor_id = @user.id
    if @questionnaire.save && @user.save
      render json: {error_code:0, data:@questionnaire, message:'ok'}, status: 201
    else
      render json: {error_code:500, message:@questionnaire.errors}, status: 201
    end
  end

  def update
    if @questionnaire.update(questionnaire_params)
      render json: {error_code:0, data:@questionnaire, message:'ok'}, status: 202
    else
      render json: {error_code:500, message:@questionnaire.errors}, status: 202
    end
  end

  def destroy
    @questionnaire.destroy
    render json: {error_code:0, message:'ok'}, status: 204
  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:name, :description, :questions, :results)
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find_by_id params[:id].to_i
    @questionnaire = @questionnaire || {}
  end
  # def _to_i(param, default_no = 1)
  #   param && param&.to_i > 0 ? param&.to_i : default_no.to_i
  # end

  # api/v1/questionnaires?page=1
  # def set_page
  #   @page      = _to_i(params[:page], 1)
  #   @page      = set_per_page * (@page - 1)
  # end
  #
  # # api/v1/questionnaires?per_page=10
  # def set_per_page
  #   @per_page  = _to_i(params[:per_page], 10)
  # end
end