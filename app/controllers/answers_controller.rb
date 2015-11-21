class AnswersController < ApplicationController
  before_action :question_id, only: [:create]

  def create
    @question = Question.find(question_id)

    case @question.type
      when 'TextQuestion'
        @answer = @question.answers.create(text_answer_params)
      when 'MultiQuestion'
        @answer = @question.answers.create(multi_answer_params) 
      when 'ScaleQuestion'
        @answer = @question.answers.create(scale_answer_params) 
      else
        @answer = @question.answers.create(text_answer_params) 
    end
    
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

    def text_answer_params
      params.require(:answer).permit(:text_answer, :device_id).merge(type: 'TextAnswer')
    end

    def multi_answer_params
      params.require(:answer).permit(:choice_id, :device_id).merge(type: 'MultiAnswer')
    end

    def scale_answer_params
      params.require(:answer).permit(:value, :device_id).merge(type: 'ScaleAnswer')
    end
end