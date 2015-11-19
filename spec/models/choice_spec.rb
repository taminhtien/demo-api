require 'rails_helper'

RSpec.describe Choice, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_presence_of :question_id}
  end

  context 'assosciations' do
    it { is_expected.to belong_to :question }
  end
end