require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: FactoryGirl.attributes_for(:user)
    end

    assert_redirected_to root_path
  end

end
