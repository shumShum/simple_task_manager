# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :story do
    title 'Test task' 
    body 'description for testt task'
    parent_id 1
    child_id 2
  end

end