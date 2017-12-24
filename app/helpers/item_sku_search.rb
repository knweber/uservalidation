def find_sku(product_id, influencer_id)
  ShopifyAPI::Product.where(id: product_id)

end

def create_influencer_orders(influencer,monthly_order_id)
  # create order for single user
  influencer_order = InfluencerOrder.create(influencer_id: influencer.id)

  # find monthly collection/master product
  master_prod = MonthlyOrder.find(monthly_order_id).master_prod_id

  master_prod.attributes.each do |attr|
    if attr && attr != master_prod_id
      LineItem.create(
        product_id:
        variant_id:
        sku:
        quantity: 1,
        price:
        title:
        influencer_order_id: influencer_order.order_number
      )
    end
  end

end
