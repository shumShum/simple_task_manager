# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user, aliases: [:parent, :child, :commentator] do
    name "Username"
    sequence(:email) {|n| "user#{n}@test.com" }
    password "password"
    password_confirmation "password"
  end

end