class Ticket < ActiveRecord::Base

  has_many :orders

  header_arr = ["order_number","groupon_number","order_date","merchant_sku_item","quantity_requested","shipment_method_requested","shipment_address_name","shipment_address_street","shipment_address_street_2","shipment_address_city","shipment_address_state","shipment_address_postal_code","shipment_address_country","gift","gift_message","quantity_shipped","shipment_carrier","shipment_method","shipment_tracking_number","ship_date","groupon_sku","custom_field_value","permalink","item_name","vendor_id","salesforce_deal_option_id","groupon_cost","billing_address_name","billing_address_street","billing_address_city","billing_address_state","billing_address_postal_code","billing_address_country","purchase_order_number","product_weight","product_weight_unit","product_length","product_width","product_height","product_dimension_unit","customer_phone","incoterms","hts_code","3pl_name","3pl_warehouse_location","kitting_details","sell_price","deal_opportunity_id","shipment_strategy","fulfillment_method","country_of_origin","merchant_permalink","feature_start_date","feature_end_date","bom_sku","payment_method","color_code","tax_rate","tax_price"]

  before_create do
    if filename.nil?
      current_date = DateTime.now
      name = 'EllieInfluencers' + rand(0..100).to_s + current_date.strftime("_%^B%Y")  + '.csv'
      self.filename = name
    end
  end

  def create_csv_file(ticket_id)
    @ticket = Ticket.find(ticket_id)
    @orders = Order.where(ticket_id: @ticket.id)
    column_header = header_arr
    CSV.open(@ticket.filename,'w',:write_headers => true,
    :headers => column_header) do |header|
      column_header = nil
      @orders.each do |order|
        order.line_items.each do |item|

          data_out = [
            order.order_number,
            "",
            "",
            "",
            item.sku,
            "",
            order.influencer.first_name + " " + order.influencer.last_name,
            order.influencer.address1,
            order.influencer.city,
            order.influencer.state,
            order.influencer.zip,
            "US",
            "FALSE",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            item.title,
            "",
            "",
            "",
            order.influencer.first_name + " " + order.influencer.last_name,
            order.influencer.address1,
            order.influencer.city,
            order,influencer.state,
            order.influencer.zip,
            "US",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            order.influencer.phone,
            "",
            "",
            "",
            "",
            "",
            item.price,
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "" + "\n"
          ]
          order << data_out
        end
      end
    end
  end

end
