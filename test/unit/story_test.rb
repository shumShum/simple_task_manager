require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  test "valid creation new story" do
    story = Story.new(title: 'Story title', body: 'Description', parent_id: 1, child_id: 1)
    assert story.save
  end
  
end
