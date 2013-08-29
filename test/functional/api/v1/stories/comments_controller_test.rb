require 'test_helper'

class Api::V1::Stories::CommentsControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in(@user)

    @story = create :story
    @comment = create 'story/comment'
  end

  test "should create comment" do
    attrs = attributes_for('story/comment')
    attrs[:user_id] = @user.id
    post :create, story_id: @story, story_comment: attrs, format: :json

    assert_response :success
    comment = Story::Comment.where(body: attrs[:body]).first
    assert { comment }
  end

  test "should destroy comment" do
    delete :destroy, story_id: @comment.story, id: @comment, format: :json

    assert_response :success
    assert { !Story::Comment.exists?(@comment) }
  end

end
