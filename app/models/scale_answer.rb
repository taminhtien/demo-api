class ScaleAnswer < Answer
  validates :value, presence: true

  def self.result(question_id)
    { total: all.size,  average: average(:value).to_f }
  end
end