require 'rails_helper'

RSpec.describe ScaleAnswer, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :value}
  end

  describe '.result' do
    let!(:question)         { create(:scale_question) }
    let!(:first_answers)    { create(:scale_answer, question: question, value: 10) }
    let!(:second_answers)   { create(:scale_answer, question: question, value: 90) }
    let!(:expected)         { { total: 2, average: 50 } }
    
    it 'returns an average number of all scale answer' do
      expect(ScaleAnswer.result(question.id)).to eq expected
    end
  end
end