require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid creation new user" do
    user = User.new attributes_for :user
    assert { user.save }
  end

  test "createion new user with bad password confirm" do
    user = User.new attributes_for :user
    user.password_confirmation = 'wrong password'
    assert { !user.save }
  end

  test "invalid email" do
    user = User.new attributes_for :user
    [ 'qwe.ru',
      'qwe qwe@mail.ru',
      'user@foo,com',
      'example.user@foo.'
      ].each do |email|
      user.email = email
      assert !user.save
    end
    user.email = 'qwe@mail.ru'
    user.save
    user = User.new(email: 'qwe@mail.ru', password: '123456', password_confirmation: '123456')
    assert { !user.save }
  end

end
