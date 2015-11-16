FactoryGirl.define do
  factory :text_answer do
    text_answer 'Good answer'
    association :question
  end
end