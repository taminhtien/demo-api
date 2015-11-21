require 'rails_helper'

RSpec.describe TextAnswer, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :text_answer }
  end

  context 'associations' do
    it { is_expected.to belong_to :question }
  end

  describe '.result' do
    let!(:question) { create(:text_question) }
    let!(:text_answers) { create_list(:text_answer, 3, question: question) }
    
    it 'returns an array of text answer' do
      expect(TextAnswer.result(question.id)).to eq text_answers
    end
  end
end