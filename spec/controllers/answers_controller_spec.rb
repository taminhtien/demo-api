require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe '#create' do
    def do_request
      post :create, question_id: question.id, answer: answer_params
    end
    
    describe 'TextAnswer' do
      let!(:question) { create(:text_question) }
      
      context 'Success' do 
        let!(:device) { create(:device) }
        let!(:answer_params) { attributes_for(:text_answer, device_id: device.id ) }
        let(:expected_answer_as_json) { TextAnswer.last.to_json }

        it 'creates an answer successfully' do
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

    describe 'MultiAnswer' do
      let!(:question) { create(:multi_question) }
      let!(:device) { create(:device) }
      let!(:ruby) { create(:choice, name: 'Ruby', question: question) }
      
      context 'Success' do   
        let!(:answer_params) { attributes_for(:multi_answer, device_id: device.id, choice_id: ruby.id) }
        let(:expected_answer_as_json) { MultiAnswer.last.to_json }

        it 'creates an answer successfully' do
          do_request
          expect(response.body).to match expected_answer_as_json
        end
      end

      context 'Failure' do
        let!(:answer_params) { attributes_for(:multi_answer, device_id: device.id) }

        it 'renders error message' do
          do_request
          expect(response.status).to eq 422
        end
      end
    end
  end
end