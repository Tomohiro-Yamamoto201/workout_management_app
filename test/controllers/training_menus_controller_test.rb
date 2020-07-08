require 'test_helper'

class TrainingMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get training_menus_new_url
    assert_response :success
  end

end
