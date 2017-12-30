require 'spec_helper'
require 'factory_bot'
require_relative '../../app/models/order.rb'
require_relative '../../app/models/ticket.rb'

describe Ticket, type: :model do

  context 'associations' do
    it { is_expected.to have_many(:orders) }
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
  end
end
