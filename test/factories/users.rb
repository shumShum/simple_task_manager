# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user, aliases: [:assigner, :assignee, :commentator] do
    name "Username"
    sequence(:email) {|n| "user#{n}@test.com" }
    password "password"
    password_confirmation "password"
  end

end