require 'spec_helper'

describe Influencer, type: :model do

  context 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to validate_presence_of(:address1) }

    it { is_expected.to validate_presence_of(:city) }

    it { is_expected.to validate_presence_of(:state) }

    it { is_expected.to validate_presence_of(:zip) }

    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_presence_of(:bra_size) }

    it { is_expected.to validate_presence_of(:top_size) }

    it { is_expected.to validate_presence_of(:sports_jacket_size) }

    it { is_expected.to validate_presence_of(:bottom_size) }

    it { is_expected.to validate_presence_of(:three_item) }

  end

  context 'associations' do
    it { is_expected.to have_many(:orders) }
  end
end
