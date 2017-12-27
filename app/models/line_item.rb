class LineItem < ActiveRecord::Base

  belongs_to :order

  has_many :item_properties

  # def find_sku
  # end

  def find_product(product_id)
    product = ShopifyAPI::Product.find(product_id)
  end

  def get_influencer_sizes(influencer_id)
    @influencer = Influencer.find(influencer_id)
    sizes = {
      "sports-bra": @influencer.bra_size,
      "top": @influencer.top_size,
      "bottom": @influencer.bottom_size,
      "sports-jacket": @influencer.sports_jacket_size
    }
  end

  def find_correct_variant(order_id,product_id,type)
    @order = Order.find(order_id)
    @influencer = Influencer.find(@order.influencer_id)
    variants = find_product(product_id).variants
    correct_variant



  end

end
