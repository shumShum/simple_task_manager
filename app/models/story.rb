class Story < ActiveRecord::Base
  belongs_to :assignee, class_name: 'User'
  belongs_to :assigner, class_name: 'User'

  has_many :comments

  mount_uploader :pic, StoriesUploader

  validates :body, presence: true
  validates :title, presence: true
  validates :assigner, presence: true
  validates :assignee, presence: true

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
