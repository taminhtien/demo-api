require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :title}
  end

  context 'assosciations' do
    it { is_expected.to have_many :answers }
  end
end