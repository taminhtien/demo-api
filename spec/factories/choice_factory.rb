FactoryGirl.define do
  factory :choice do
    sequence(:name) { |n| "Choice #{n}" }
    association :question
  end
end