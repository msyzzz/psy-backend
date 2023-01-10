require 'uri'
require 'net/http'
require 'net/https'
require 'json'

class ChatbotController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @user = User.first
    @chatlogs = Chatbot.where("user_id = ?", @user.id).all
    
    render json: {
      "chatlogs": @chatlogs,
      "user": @user,
    }
  end
  def send_get(content)
    uri = URI('http://api.qingyunke.com/api.php')
    params = { :key => "free", :msg => content }
    uri.query = URI.encode_www_form(params)
  
    res = Net::HTTP.get_response(uri)
    return res.body if res.is_a?(Net::HTTPSuccess)
  end

  def create
    @user_log = Chatbot.new(chatbot_params)
    bot_res = JSON.parse send_get(@user_log.content)
    @bot_log = Chatbot.new(content: bot_res['content'], user_id: @user_log.user_id, from_bot: true)
    # puts "---"
    # puts json: @user_log
    # puts json: @bot_log
    # puts bot_res['content']
    # puts "---"
    @user_log.save
    @bot_log.save
    # if @chatbot.save
    #   # render status: 200
    #   render json:@appointment
    # else
    #   render json:@appointment,status: :unprocessable_entity
    # end
  end
  private
    def chatbot_params
      params.require(:chatbot).permit(:content, :user_id,:from_bot)
    end
end
