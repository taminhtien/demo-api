FactoryGirl.define do
  factory :question do
    title 'Best question'
  end

  factory :text_question do
    title 'Best question'
    type :TextQuestion
  end

  factory :multi_question do
    title 'Best question'
    type :MultiQuestion
    trait :with_4_choices do 
      after(:create) do |question|
        create_list(:choice, 4, question: question)
      end
    end
  end
end