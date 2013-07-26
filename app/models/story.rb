class Story < ActiveRecord::Base
  attr_accessible :title, :body, :parent_id, :child_id

  belongs_to :child, class_name: 'User'
  belongs_to :parent, class_name: 'User'

end
