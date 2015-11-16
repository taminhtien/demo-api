require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe '#create' do
    def do_request
      post :create, question_id: question.id, answer: answer_params
    end
    
    let!(:question) { create(:question) }
    
    context 'TextAnswer' do
      let!(:answer_params) { attributes_for(:text_answer) }
      let(:expected_answer_as_json) { TextAnswer.last.to_json }

      it 'creates successfully an answer' do
        do_request
        expect(response.body).to match expected_answer_as_json
      end
    end
  end
end