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

end
