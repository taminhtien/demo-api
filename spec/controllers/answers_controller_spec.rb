require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe '#create' do
    def do_request
      post :create, question_id: question.id, answer: answer_params
    end
    
    let!(:question) { create(:text_question) }
    
    context 'TextAnswer' do
      context 'Success' do
        let!(:answer_params) { attributes_for(:text_answer) }
        let(:expected_answer_as_json) { TextAnswer.last.to_json }

        it 'creates successfully an answer' do
          do_request
          expect(response.body).to match expected_answer_as_json
        end
      end

      context 'Failure' do
        let!(:answer_params) { attributes_for(:text_answer, text_answer: '') }

        it 'renders error message' do
          do_request
          expect(response.status).to eq 422
        end
      end
    end
  end
end