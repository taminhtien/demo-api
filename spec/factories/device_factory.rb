FactoryGirl.define do
  factory :device do
    sequence(:uuid) { |n| "#{SecureRandom.uuid}#{n}"}
  end
end