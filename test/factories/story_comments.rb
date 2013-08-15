# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory 'story/comment' do
    sequence(:body) {|n| "comment #{n} body" }
    association :user, factory: :commentator
    story
  end

end