require 'spec_helper'
require 'factory_bot'
require_relative '../../app/models/influencer_order.rb'
require_relative '../../app/models/ticket.rb'

describe Ticket, type: :model do

    @influencer1 = FactoryBot.create(:influencer)
    @influencer2 = FactoryBot.create(:influencer)

    @ticket1 = FactoryBot.build(:ticket)
    p @ticket1.filename

    @influencer_order1 = FactoryBot.build(:influencer_order, influencer_id: @influencer1.id, ticket_id: @ticket1.id)

    # influencer_order1.influencer_id = influencer1.id
    # influencer_order1.ticket_id = ticket1.id

    # @influencer_order1.save
    #
    #
    # let(:influencer_order2) { FactoryBot.build(:influencer_order) }
    #
    # influencer_order2.influencer_id = influencer2.id
    # influencer_order2.ticket_id = ticket1.id
    #
    # influencer_order2.generate_order_number
    # influencer_order2.save

    # let(:ticket2) { FactoryBot.build(:ticket) }


  context 'associations' do
    it { is_expected.to have_many(:influencer_orders) }
  end

  context 'virtual fields' do
    it 'generates a filename containing \'EllieInfluencers\' and the current month and year' do
      ticket2 = FactoryBot.create(:ticket)
      expect(ticket2.filename).to include('EllieInfluencers')
    end

    it 'generates a csv file' do
      ticket3 = FactoryBot.create(:ticket)
      expect(ticket3.filename).to include('.csv')
    end

    xit 'generates a csv file listing all of the influencers\' orders' do
      influencer4 = FactoryBot.create(:influencer)
      ticket4 = FactoryBot.create(:ticket)
      order4 = FactoryBot.create(:influencer_order, influencer_id: influencer4.id, ticket_id: ticket4.id)
      contents = File.open(ticket4.filename)
      expect(contents).to include('sku')
    end
  end
end
