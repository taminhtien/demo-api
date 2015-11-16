require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe '#show' do
    def do_request
      get :show, id: question.id
    end

    context 'open text' do
      let!(:question) { create(:question) }
      let!(:question_as_json) { question.to_json }

      it 'assigns question and renders question as json' do
        do_request
        expect(assigns(:question)).to match question
        expect(response.body).to eq question_as_json
      end
    end
  end
end