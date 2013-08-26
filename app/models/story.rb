class Story < ActiveRecord::Base
  belongs_to :assignee, class_name: 'User'
  belongs_to :assigner, class_name: 'User'

  has_many :comments, class_name: CommentNewType
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true

  mount_uploader :pic, StoriesUploader

  validates :body, presence: true
  validates :title, presence: true
  validates :assigner, presence: true
  validates :assignee, presence: true

  paginates_per 10

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
