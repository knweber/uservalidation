require 'securerandom'
require 'csv'

class InfluencerOrder < ActiveRecord::Base

  validates :order_number, uniqueness:true
  validates :send_receipt
  validates :send_fulfillment_receipt
  validates :influencer_id, presence:true

  belongs_to :influencer
  belongs_to :ticket

  has_many :line_items

  def self.generate_order_number
    self.order_number = "#IN" + SecureRandom.hex(6)
  end

  # def self.generate_influencer_items
  #
  # end

  def download_csv(filename)
    content_type('application/csv')
    attachment(filename)
    generate_file()
  end


end
