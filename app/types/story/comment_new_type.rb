class Story::CommentNewType < Story::Comment
  attr_accessible :body, :user_id, :story_id, :parent_id

  validates :body, presence: true
  validates :user, presence: true
  validates :story, presence: true
end