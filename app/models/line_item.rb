class LineItem < ActiveRecord::Base

  validates :product_id, presence: true
  validates :variant_id, presence: true
  validates :quantity, presence: true
  validates :sku, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :influencer_order_id, presence: true

  belongs_to :influencer_order

  has_many :item_properties

end
