class TextAnswer < Answer
  validates :text_answer, presence: true

  def self.result(question_id)
    where(question_id: question_id).includes(:device)
  end
end