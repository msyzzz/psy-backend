require 'test_helper'

class ConsultsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get consults_show_url
    assert_response :success
  end

end
