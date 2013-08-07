# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user do
    name "Username"
    email "username@test.ru"
    password "password"
    password_confirmation "password"
  end

end