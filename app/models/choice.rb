class Choice < ActiveRecord::Base
  belongs_to :question
  
  validates :name, :question_id, presence: true
end