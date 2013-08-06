require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "should create user" do
    # assert_difference('User.count') do
      post :create, user: {name: 'Username'}
    #   binding.pry
    # end

    assert_redirected_to root_path
  end

end
