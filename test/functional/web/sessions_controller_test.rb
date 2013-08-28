require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase

   def setup
    @user = create :user
   end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create session' do
    auth_attr = {email: @user.email, password: @user.password}
    post :create, session: auth_attr

    assert_response :redirect
    assert { signed_in? }
  end

  test 'should destroy session' do
    sign_in @user

    delete :destroy

    assert_response :redirect
    assert { !signed_in? }
  end

end
