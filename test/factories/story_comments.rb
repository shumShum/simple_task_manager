# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory 'story/comment' do
    body
    association :user, factory: :commentator
    story
  end

end