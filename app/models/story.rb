class Story < ActiveRecord::Base
  attr_accessible :title, :body, :parent_id, :child_id

  belongs_to :child, class_name: 'User'
  belongs_to :parent, class_name: 'User'

  has_many :story_comments

  validates :body, presence: true
  validates :title, presence: true
  validates :parent_id, presence: true
  validates :child_id, presence: true
  validates :state, presence: true

  state_machine initial: :new do
    state :start, :finish, :accept, :reject

    event :to_start do
      transition [:new, :reject] => :start
    end

    event :to_finish do
      transition start: :finish
    end

    event :to_accept do
      transition finish: :accept 
    end

    event :to_reject do
      transition finish: :reject
    end
  end

end
