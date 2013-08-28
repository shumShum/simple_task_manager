class Story::Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  has_ancestry

  validates :body, presence: true
  validates :user, presence: true
  validates :story, presence: true

end
