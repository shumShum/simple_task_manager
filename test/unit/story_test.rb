require 'test_helper'

class StoryTest < ActiveSupport::TestCase

  def setup
    @assigner = create :assigner
    @assignee = create :assignee
  end

  test "valid creation new story" do
    story = StoryNewType.new attributes_for :story
    story.assigner = @assigner
    story.assignee = @assignee
    assert { story.save }
  end

end
