require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test "should create user" do
    attrs = attributes_for(:user)
    post :create, user: attrs

    assert_response :redirect
    user = User.where(email: attrs[:email]).first
    assert user
  end

end
