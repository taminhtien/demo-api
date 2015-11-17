FactoryGirl.define do
  factory :question do
    title 'Best question'
  end

  factory :text_question, parent: :question do
    type :TextQuestion
  end
end