FactoryGirl.define do
  factory :answer do
    device
    association :question
  end

  factory :text_answer, parent: :answer, class: 'TextAnswer' do
    text_answer 'Good answer'
  end

  factory :multi_answer, parent: :answer, class: 'MultiAnswer' do
    choice
  end

  factory :scale_answer, parent: :answer, class: 'ScaleAnswer' do
    sequence(:value) { |n| n }
  end
end