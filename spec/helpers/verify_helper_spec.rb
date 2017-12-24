require 'spec_helper'
include Helpers
require_relative '../../app/helpers/verify_helper.rb'

describe helpers do

  context '#check_non_english' do
    it 'should replace non-English letters with their English equivalents' do
      str = 'aabbcc'
      fixed = check_non_english(str)
      expect(fixed).to eq(str)

    end
  end

  xcontext '#invalid_emails' do

    it 'should check the validity of each user\'s email address' do

    end

    it 'should write any invalid users to invalid_emails.txt' do

    end

    it 'should return false if invalid users are found' do

    end

    it 'should return true if all users are valid' do

    end

    it 'should erase invalid_emails.txt contents before adding new records' do

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
