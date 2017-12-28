require 'securerandom'
require 'csv'

class Order < ActiveRecord::Base

  validates :influencer_id, presence:true

  belongs_to :influencer
  belongs_to :ticket

  has_many :line_items

  def self.order_number
    @order_number ||= "#IN" + SecureRandom.random_number(36**12).to_s(36).rjust(12,"0")
  end

  def create_order(influencer,items,collection_id)
    order = Order.new(influencer_id: influencer.id)
    order[:order_number] = Order.order_number
    order[:collection_id] = collection_id

    sizes = [influencer.bra_size, influencer.top_size, influencer.bottom_size, influencer.sports_jacket_size]
  end

end
