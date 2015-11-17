require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :title}
    it { is_expected.to enumerize(:type).in(:TextQuestion, :MultiChoiceQuestion, :ScaleQuestion) }
  end

  context 'assosciations' do
    it { is_expected.to have_many :answers }
  end
end