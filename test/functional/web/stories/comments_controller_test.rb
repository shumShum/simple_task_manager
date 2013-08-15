require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user.id)

    @story = create :story
    @comment = create 'story/comment'
  end

  test "should create comment" do
    attrs = attributes_for('story/comment')
    attrs[:user_id] = @user.id
    post :create, story_id: @story, story_comment: attrs

    assert_response :success
    comment = Story::Comment.where(body: attrs[:body]).first
    assert comment
  end

  test "should destroy comment" do
    delete :destroy, story_id: @comment.story, id: @comment

    assert_response :success
    assert !Story::Comment.exists?(@comment)
  end

end
