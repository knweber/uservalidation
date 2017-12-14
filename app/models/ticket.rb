class Ticket < ActiveRecord::Base

  validates :order_number, presence:true

  has_one :order

end
