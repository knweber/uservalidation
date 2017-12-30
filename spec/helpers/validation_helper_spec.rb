require 'spec_helper'
require 'factory_bot'

describe "ValidationHelpers" do
  include ValidationHelpers

  context '#check_non_english' do
    it 'should replace non-English letters with their English equivalents' do
      str = 'àabþcc'
      fixed = check_non_english(str)
      expect(fixed).to eq('aabbcc')
    end
  end

  context '#invalid_emails' do

    xit 'should check the validity of each user\'s email address' do
    end

    xit 'should return false if invalid users are found' do
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
