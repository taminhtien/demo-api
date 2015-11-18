FactoryGirl.define do
  factory :answer do
    device
    association :question
  end

  factory :text_answer, parent: :answer, class: 'TextAnswer' do
    text_answer 'Good answer'
  end
end