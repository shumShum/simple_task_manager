class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :password, presence: true, 
                      on: :create,
                      length: {minimum: 6, maximum: 32}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  has_many :to_stories, class_name: 'Story', foreign_key: 'child_id'
  has_many :by_stories, class_name: 'Story', foreign_key: 'parent_id'

end
