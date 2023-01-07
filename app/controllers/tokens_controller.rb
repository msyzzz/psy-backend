class TokensController < ApplicationController
  def create
    @user = User.find_by_index(user_params[:index])
    p @user
    unless @user.authenticate(user_params[:password])
      head 401
      return
    end


    exp_time = 24.hours.from_now
    payload = {user_id: @user.id, exp: exp_time.to_i}
    token = JWT.encode(payload, Rails.application.secrets.secret_key_base)
    render json: {error_code:0, data:{token:token, exp_time:exp_time}, message:"ok"}, status: 201
  end

  private
  def user_params
    params.require(:user).permit(:index, :password)
  end
end
