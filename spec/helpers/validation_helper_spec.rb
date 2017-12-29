require 'spec_helper'

describe "ValidationHelpers" do
  include ValidationHelpers

  Influencer.destroy_all

  email1 = "example@gmail.com"
  email2 = "june@gmail.comm"
  email3 = "purple@gmaill.com"
  email4 = "1@2.com"
  email5 = "kjfdhdkj@kdjfhgkdfjhg.krhtk"
  email6 = "dolphin@hotmail.com"
  email7 = "bob@joe.com"

  @influencer1 = FactoryBot.create(:influencer, email: email1)
  @influencer2 = FactoryBot.create(:influencer, email: email2)
  @influencer3 = FactoryBot.create(:influencer, email: email3)
  @influencer4 = FactoryBot.create(:influencer, email: email4)
  @influencer5 = FactoryBot.create(:influencer, email: email5)
  @influencer6 = FactoryBot.create(:influencer, email: email6)
  @influencer7 = FactoryBot.create(:influencer, email: email7)

  @inval_users = Influencer.all.to_s


  @val_user = [@influencer6, @influencer7]

  p @inval_users

  p @val_user
  # File.open('sample.csv','a+') do |file|
  #   @users.each do |user|
  #     file.write(user)
  #     file.write("\n")
  #   end
  # end
  #
  # rows = CSV.parse('sample.csv')

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

    xit 'should write any invalid users to invalid_emails.txt' do

    end

    it 'should return false if invalid users are found' do
      expect(invalid_emails(@inval_users)).to be(false)
    end

    it 'should return true if all users are valid' do
      expect(invalid_emails(Influencer.last)).to be(true)
    end

    xit 'should erase invalid_emails.txt contents before adding new records' do

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
