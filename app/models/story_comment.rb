class StoryComment < ActiveRecord::Base
  attr_accessible :body, :user_id, :story_id

  belongs_to :user
  belongs_to :story

  validates :body, presence: true
  validates :user_id, presence: true
  validates :story_id, presence: true
end
