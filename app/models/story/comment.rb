class Story::Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  has_ancestry

end
