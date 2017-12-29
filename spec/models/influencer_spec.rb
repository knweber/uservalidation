require 'spec_helper'

describe Influencer, type: :model do

  context 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_presence_of(:bra_size) }

    it { is_expected.to validate_presence_of(:top_size) }

    it { is_expected.to validate_presence_of(:sports_jacket_size) }

    it { is_expected.to validate_presence_of(:bottom_size) }

    it { is_expected.to validate_presence_of(:three_item) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'associations' do
    it { is_expected.to have_many(:orders) }
  end
end
