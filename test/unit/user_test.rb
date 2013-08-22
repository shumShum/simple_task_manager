require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid creation new user" do
    user = UserSignUpType.new attributes_for :user
    assert { user.save }
  end

  test "createion new user with bad password confirm" do
    user = UserSignUpType.new attributes_for :user
    user.password_confirmation = 'wrong password'
    assert { !user.save }
  end

end
