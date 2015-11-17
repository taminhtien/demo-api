require 'rails_helper'

RSpec.describe Device, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of :uuid }
    it { is_expected.to validate_uniqueness_of :uuid }
  end

  context 'association' do
    it { is_expected.to have_many :answers }
  end
end