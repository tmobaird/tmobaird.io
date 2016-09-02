FactoryGirl.define do
  factory :project do
    sequence(:title) { |x| "Project #{x}" }
    description "Test description"
    sequence(:github_url) { |x| "github.com/user#{x}/" }
    sequence(:app_url) { |x| "google.com/site#{x}/" }
  end
end
