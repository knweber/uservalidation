class Order < ActiveRecord::Base

  validates :influencer_id, presence:true
  validates :ticket_id, presence:true

  belongs_to :ticket
  belongs_to :influencer
  has_many :line_items

end
