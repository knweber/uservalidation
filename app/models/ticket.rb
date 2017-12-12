class Ticket < ActiveRecord::Base

  validates :order_number, presence:true

  has_many :orders

end
