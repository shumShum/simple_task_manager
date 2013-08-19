require 'test_helper'

class StoryCommentTest < ActiveSupport::TestCase

  def setup
    @commentator = create :commentator
    @story = create :story
  end

  test "valid creation new story_comment" do
    comment = Story::Comment.new attributes_for 'story/comment'
    comment.user = @commentator
    comment.story = @story
    assert comment.save
  end

end
