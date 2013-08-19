require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def test_welcome_email
    user = create :user

    email = UserMailer.send_welcome_email(user).deliver
    assert !ActionMailer::Base.deliveries.empty?
  end
end