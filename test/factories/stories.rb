# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :story do
    title 'Test task' 
    body 'description for test task'
    parent
    child
  end

end