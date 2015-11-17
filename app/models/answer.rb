class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :device
end