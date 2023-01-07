module Authuser
  def current_user
    return @current_user if @current_user

    token = request.headers['Authorization']
    return nil if token.nil?

    info= JWT.decode(token, Rails.application.secrets.secret_key_base)
    @current_user = User.find_by_id(info[0]["user_id"])
  end
end