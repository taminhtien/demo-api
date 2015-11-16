class AnswersController < ApplicationController
  before_action :question_id, only: [:create]

  def create
    @question = Question.find(question_id)
    @answer = @question.answers.create(answer_params)

    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  private

    def question_id
      params.require(:question_id)
    end

    def answer_params
      params.require(:answer).permit(:text_answer).merge(type: 'TextAnswer')
    end
end