class Story::CommentDecorator < ApplicationDecorator
  delegate_all
  decorates_association :children

end