require 'securerandom'
require 'csv'

class InfluencerOrder < ActiveRecord::Base

  validates :influencer_id, presence:true

  belongs_to :influencer
  belongs_to :ticket

  has_many :line_items

  # def generate_number
  #   unique_num = SecureRandom.random_number(36**12).to_s(36).rjust(12,"0")
  # end

  def order_number
    @order_number ||= "#IN" + SecureRandom.random_number(36**12).to_s(36).rjust(12,"0")
    self.order_number = @order_number
  end

end
