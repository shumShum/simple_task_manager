class StoryEditType < Story
  include BaseType

  attr_accessor :current_user
  attr_accessible :title, :body, :assigner_id, :assignee_id, :pic, :comments_attributes, :state_event

  has_many :comments, class_name: CommentNewType

  def comments_attributes=(attrs)
    attrs.each do |key, value|
      if !value.has_key?(:id)
        value[:user_id] = current_user.id
      end
    end
    super
  end
end