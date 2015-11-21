require 'rails_helper'

RSpec.describe MultiAnswer, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :choice_id}
  end

  context 'associations' do
    it { is_expected.to belong_to :question }
  end

  describe '.result' do
    let!(:question)       { create(:multi_question) }
    let!(:ruby)           { create(:choice, name: 'Ruby', question: question) }
    let!(:python)         { create(:choice, name: 'Python', question: question) }
    let!(:ruby_answers)   { create_list(:multi_answer, 3, question: question, choice_id: ruby.id) }
    let!(:python_answers) { create_list(:multi_answer, 2, question: question, choice_id: python.id) }
    let!(:expected)       { [{ ruby.id => 0.6 }, { python.id => 0.4 }] }
    
    it 'returns an desirable json containing percentages of each choices' do
      expect(MultiAnswer.result(question.id)).to eq expected
    end
  end
end