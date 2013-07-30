require 'test_helper'

class StoryCommentTest < ActiveSupport::TestCase
  
  test "valid creation new story_comment" do
    sc = StoryComment.new(body: 'comment body', user_id: 1, story_id: 1)
    assert sc.save
  end

end
