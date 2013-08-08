require 'test_helper'

class StoryCommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user.id)
  end

  test "should create comment" do
    attrs = attributes_for(:story_comment)
    post :create, story_comment: attrs

    assert_response :success
    comment = StoryComment.where(body: attrs[:body]).first
    assert comment
  end

end