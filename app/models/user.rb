class User < ActiveRecord::Base
  has_secure_password

  has_many :to_stories, class_name: 'Story', foreign_key: 'assignee_id'
  has_many :by_stories, class_name: 'Story', foreign_key: 'assigner_id'
  has_many :story_comments

  validates :password, presence: true,
                      on: :create,
                      length: {minimum: 6, maximum: 32}
  validates :email, presence: true,
                    uniqueness: true,
                    email: true
  validates :name, presence: true

  def to_s
    name
  end
end
