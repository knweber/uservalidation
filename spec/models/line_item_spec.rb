require 'spec_helper'

describe LineItem, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to have_many(:item_properties) }
  end
end
