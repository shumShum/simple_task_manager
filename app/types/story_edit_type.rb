class StoryEditType < Story
  include BaseType

  attr_accessible :title, :body, :assigner_id, :assignee_id, :pic, :comments_attributes, :state_event

  has_many :comments, class_name: CommentNewType
end