require 'test_helper'

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get tasks_top_url
    assert_response :success
  end

end
