require 'rails_helper'

RSpec.describe MultiAnswer, type: :model do
  it { is_expected.to validate_presence_of :choice_id}
end