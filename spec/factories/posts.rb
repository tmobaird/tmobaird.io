# frozen_string_literal: true

FactoryGirl.define do
  factory :post do
    title 'MyString'
    body 'MyText'
    admin
  end
end
