class TextAnswer < Answer
  validates :text_answer, presence: true
  belongs_to :question
end