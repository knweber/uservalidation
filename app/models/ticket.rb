require 'securerandom'

class Ticket < ActiveRecord::Base

  validates :order_number, uniqueness:true

  has_many :influencer_items

  accepts_nested_attributes_for :influencer_items

  def self.generate_order_number
    "#IN" + SecureRandom.hex(6)
  end

  def

end
