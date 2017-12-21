require 'spec_helper'
require_relative '../factories/influencer.rb'

xdescribe 'Tickets' do

  # @influencer1 = FactoryBot.create(:influencer)
  # @influencer2 = FactoryBot.create(:influencer)
  # @influencer_order1 = FactoryBot.create(:influencer_order)
  # @influencer_order2 = FactoryBot.create(:influencer_order)
  # @ticket1 = FactoryBot.create(:ticket)
  #
  # @influencer_order1.ticket_id = @ticket1.id
  # @influencer_order2.ticket_id = @ticket1.id

  context 'associations' do
    it { is_expected.to have_many(:influencer_orders) }
  end

  context 'virtual fields' do
    @ticket1.assign_filename
    it 'generates a filename containing \'EllieInfluencers\' and the current month and year' do
      expect(@ticket1.filename).to include('EllieInfluencers')
    end

    it 'generates a csv file' do
      expect(@ticket1.filename).to include('.csv')
    end

    xit 'generates a csv file listing all of the influencers\' orders' do
    end
  end
end
