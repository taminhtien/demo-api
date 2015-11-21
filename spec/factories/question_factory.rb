FactoryGirl.define do
  factory :question do
    title 'Best question'
  end

  factory :text_question, parent: :question, class: 'TextQuestion' do
  end

  factory :multi_question, parent: :question, class: 'MultiQuestion' do
    trait :with_4_choices do 
      after(:create) do |question|
        create_list(:choice, 4, question: question)
      end
    end
  end
end