# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user, aliases: [:assigner, :assignee, :commentator] do
    name "Username"
    email
    password "password"
    password_confirmation "password"
  end

end