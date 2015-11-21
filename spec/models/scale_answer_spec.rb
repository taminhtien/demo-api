require 'rails_helper'

RSpec.describe ScaleAnswer, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :value}
  end
end