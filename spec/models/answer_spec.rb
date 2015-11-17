require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of :question_id }
    it { is_expected.to validate_presence_of :device_id }
  end

  context 'association' do
    it { is_expected.to belong_to :question }
    it { is_expected.to belong_to :device }
  end
end