class Device < ActiveRecord::Base
  has_many :answers

  validates :uuid, presence: true, uniqueness: true
end