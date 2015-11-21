FactoryGirl.define do
  factory :question do
    title 'Best question'
  end

  factory :text_question, parent: :question, class: 'TextQuestion' do
  end

  factory :multi_question, parent: :question, class: 'MultiQuestion' do
  end

  factory :scale_question, parent: :question, class: 'ScaleQuestion' do
  end
end