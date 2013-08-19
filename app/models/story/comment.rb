class Story::Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :story_id

  belongs_to :user
  belongs_to :story

  validates :body, presence: true
  validates :user, presence: true
  validates :story, presence: true
end
