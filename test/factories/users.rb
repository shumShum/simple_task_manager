# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user do
    name "Username"
    email "username@test.ru"
    password "password"
    password_confirmation "password"
  end

  factory :parent, class: 'User' do
    name "Assigner"
    email "assigner@test.ru"
    password "password"
    password_confirmation "password"
  end

  factory :child, class: 'User' do
    name "Assignee"
    email "assignee@test.ru"
    password "password"
    password_confirmation "password"
  end

  factory :commentator, class: 'User' do
    name "Commentator"
    email "commentator@test.ru"
    password "password"
    password_confirmation "password"
  end

end