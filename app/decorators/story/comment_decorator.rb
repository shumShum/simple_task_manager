class Story::CommentDecorator < ApplicationDecorator
  delegate_all
  decorates_association :children

  def date
    h.l created_at
  end
end