class Influencer < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :phone
  validates :bra_size, presence: true
  validates :top_size, presence: true
  validates :bottom_size, presence: true
  validates :sports_jacket_size, presence: true
  validates :three_item, presence: true
  # validates :billing_address_id
  # validates :shipping_address_id

  has_one :billing_address, :as => :addressable

  has_one :shipping_address, :as => :addressable

  has_one :order

end
