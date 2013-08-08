# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :story_comment do
    body 'comment body'
    association :user, factory: :commentator
    story
  end

end