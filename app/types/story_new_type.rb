class StoryNewType < Story
  include BaseType

  attr_accessible :title, :body, :assigner_id, :assignee_id, :pic

  validates :body, presence: true
  validates :title, presence: true
  validates :assigner, presence: true
  validates :assignee, presence: true
end