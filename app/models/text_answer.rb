class TextAnswer < Answer
  validates :text_answer, presence: true

  def self.result
    all
  end
end