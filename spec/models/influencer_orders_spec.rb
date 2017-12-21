require 'spec_helper'

describe 'InfluencerOrders' do
  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:order_number)}
    it { is_expected.to validate_presence_of(:influencer_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:influencer) }
    it { is_expected.to belong_to(:ticket) }
    it { is_expected.to have_many(:line_items) }
  end

  context 'virtual fields' do
    it 'has a randomly generated order number' do
      order = FactoryBot.create(:influencer_order, influencer_id: 1)
      order.generate_order_number
      order.save
      expect(order.order_number).not_to be(nil)
    end
  end

end
