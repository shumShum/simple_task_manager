class User < ActiveRecord::Base
  has_secure_password

  has_many :to_stories, class_name: 'Story', foreign_key: 'assignee_id'
  has_many :by_stories, class_name: 'Story', foreign_key: 'assigner_id'
  has_many :story_comments

end
