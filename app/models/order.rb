require 'securerandom'
require 'csv'

class Order < ActiveRecord::Base

  validates :influencer_id, presence:true

  belongs_to :influencer
  belongs_to :ticket

  has_many :line_items

  before_create do
    if order_number.nil?
      order_number = "#IN" + SecureRandom.random_number(36**12).to_s(36).rjust(12,"0")
      self.order_number = order_number
    end
  end

end
