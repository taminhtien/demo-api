class Question < ActiveRecord::Base
  extend Enumerize
  
  has_many :answers
  has_many :choices
  
  validates :title, presence: true
  enumerize :type, in: [:TextQuestion, :MultiChoiceQuestion, :ScaleQuestion]
end