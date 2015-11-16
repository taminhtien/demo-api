class QuestionsController < ApplicationController
  def show
    @question = Question.find(question_id)
    render json: @question
  end

  private

    def question_id
      params.require(:id)
    end
end