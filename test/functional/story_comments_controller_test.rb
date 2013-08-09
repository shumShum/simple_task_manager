require 'test_helper'

class StoryCommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user.id)

    @story = create :story
    # binding.pry
    @commentator = create :commentator
    @comment = create :story_comment, user_id: @commentator.id, story_id: @story.id
  end

  test "should create comment" do
    attrs = attributes_for(:story_comment)
    attrs[:story_id] = @story.id
    attrs[:user_id] = @user.id
    post :create, story_comment: attrs

    assert_response :redirect
    comment = StoryComment.where(body: attrs[:body]).first
    assert comment
  end

  test "should destroy comment" do
    delete :destroy, id: @comment

    assert_response :redirect
    assert !StoryComment.exists?(@comment)
  end

end
