require 'securerandom'
require 'csv'

class InfluencerOrder < ActiveRecord::Base

  validates :order_number, uniqueness:true
  validates :influencer_id, presence:true

  belongs_to :influencer
  belongs_to :ticket

  has_many :line_items

  def self.generate_order_number
    self.order_number = "#IN" + SecureRandom.hex(6)
  end

end
