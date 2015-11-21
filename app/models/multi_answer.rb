class MultiAnswer < Answer
  belongs_to :choice
  validates :choice_id, presence: true

  def self.result(question_id)
    answers = where(question_id: question_id)
    groups = answers.group('choice_id').count
    total = answers.count

    results = []
    percent = 0
    groups.each do |choice_id, no|
      percent = no.to_f / total.to_f if total > 0
      results << { choice_id => percent }
    end
    results
  end
end