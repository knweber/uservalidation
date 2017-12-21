require 'spec_helper'

describe InfluencerOrder, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:influencer_id) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:influencer) }
    it { is_expected.to belong_to(:ticket) }
    xit { is_expected.to have_many(:line_items) }
  end

  context 'virtual fields' do
    it 'has a randomly generated order number' do
      # order = FactoryBot.create(:influencer_order, influencer_id: 1)
      order = FactoryBot.create(:influencer_order, influencer_id: 1)
      expect(order.order_number).not_to be(nil)
      p order.order_number
    end

    it 'has 15-character order number' do
      order1 = FactoryBot.create(:influencer_order, influencer_id: 1)
      expect(order1.order_number.length).to eq(15)
      p order1.order_number
    end

    it 'does not create duplicate order numbers' do
      orders = []
      800.times do
        orders.push(FactoryBot.create(:influencer_order))
      end

      nums = []
      orders.each do |order|
        nums.push(order.order_number)
      end

      nums.uniq!
      expect(nums.length).to eq(800)

    end
  end

end
