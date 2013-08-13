require 'test_helper'

class StoryCommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user.id)

    @story = create :story
    @comment = create :story_comment
  end

  test "should create comment" do
    attrs = attributes_for(:story_comment)
    attrs[:user_id] = @user.id
    post :create, {story_id: @story, story_comment: attrs}

    assert_response :redirect
    comment = StoryComment.where(body: attrs[:body]).first
    assert comment
  end

  test "should destroy comment" do
    delete :destroy, {story_id: @comment.story, id: @comment}

    assert_response :redirect
    assert !StoryComment.exists?(@comment)
  end

end
