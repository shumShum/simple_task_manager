class StoryEditType < Story
  include BaseType

  attr_accessible :title, :body, :assigner_id, :assignee_id, :pic
end