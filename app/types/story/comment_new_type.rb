class Story::CommentNewType < Story::Comment
  include BaseType

  attr_accessible :body, :user_id, :story_id, :parent_id

end