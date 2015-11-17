class Question < ActiveRecord::Base
  extend Enumerize
  
  has_many :answers
  validates :title, presence: true
  enumerize :type, in: [:TextQuestion, :MultiChoiceQuestion, :ScaleQuestion]
end