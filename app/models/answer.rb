class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :device

  validates :question_id, presence: true
  validates :device_id, presence: true

  def self.result(question_id); end
end