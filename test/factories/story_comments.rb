# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :story_comment do
    body 'comment body'
    user_id 1
    story_id 1
  end

end