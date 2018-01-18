# frozen_string_literal: true

FactoryGirl.define do
  factory :admin do
    sequence(:email) { |x| "test.email.#{x}@gmail.com" }
    first_name 'Thomas'
    last_name 'Baird'
    password 'testing'
  end
end
