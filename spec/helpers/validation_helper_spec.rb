require 'spec_helper'
require 'factory_bot'
require 'rack/test'

describe "ValidationHelpers" do
  include ValidationHelpers
  include Rack::Test::Methods

  before(:each) do
    Influencer.destroy_all
  end

  context '#check_non_english' do
    it 'should replace non-English letters with their English equivalents' do
      str = 'àabþcc'
      fixed = check_non_english(str)
      expect(fixed).to eq('aabbcc')
    end
  end

  context '#invalid_emails' do

    xit 'should not create any influencers if invalid users are found' do
      expect(Influencer.all.count).to eq(0)
    end

    xit 'should create influencers if all users are valid' do
      expect(Influencer.all.count).to eq(4)
    end

  end

  xcontext '#create_influencer' do

    it 'should scan user records and change three_item yes/y values to true' do
    end

    it 'should scan user records and change three_item no/n values to false' do
    end

    it 'should create a new Influencer in the database' do

    end

  end

end
