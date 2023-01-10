require 'test_helper'

class ChatbotControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chatbot_show_url
    assert_response :success
  end

  test "should get new" do
    get chatbot_new_url
    assert_response :success
  end

end
