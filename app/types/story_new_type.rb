class StoryNewType < Story
  include BaseType

  attr_accessible :title, :body, :assigner_id, :assignee_id, :pic
end