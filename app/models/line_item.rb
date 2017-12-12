class LineItem < ActiveRecord::Base

  validates :product_id, presence: true
  validates :variant_id, presence: true
  validates :quantity, presence: true
  validates :billing_address, presence: true
  validates :sku, presence: true
  validates :price, presence: true
  validates :order_id, presence: true

  belongs_to :order
  
end
