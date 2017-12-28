class LineItem < ActiveRecord::Base

  belongs_to :order

  has_many :item_properties

  def find_product(product_id)
    product = ShopifyAPI::Product.find(product_id)
  end

  def find_correct_variant(order_id,product_id,type)
    @order = Order.find(order_id)
    @influencer = Influencer.find(@order.influencer_id)
    variants = find_product(product_id).variants
    correct_variant
    # STUFF HERE
  end

end
