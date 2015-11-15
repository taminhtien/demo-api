class AddTextAnswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :text_answer, :string
  end
end
