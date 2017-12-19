class Ticket < ActiveRecord::Base

  has_many :influencer_orders

  header_mapping = ["order_number","groupon_number","order_date","merchant_sku","quantity_requested","shipment_method_requested","shipment_address_name","shipment_address_street","shipment_address_street_2","shipment_address_city","shipment_address_state","shipment_address_postal_code","shipment_address_country","gift","gift_message","quantity_shipped","shipment_carrier","shipment_method","shipment_tracking_number","ship_date","groupon_sku","custom_field_value","permalink","item_name","vendor_id","salesforce_deal_option_id","groupon_cost","billing_address_name","billing_address_street","billing_address_city","billing_address_state","billing_address_postal_code","billing_address_country","purchase_order_number","product_weight","product_weight_unit","product_length","product_width","product_height","product_dimension_unit","customer_phone","incoterms","hts_code","3pl_name","3pl_warehouse_location","kitting_details","sell_price","deal_opportunity_id","shipment_strategy","fulfillment_method","country_of_origin","merchant_permalink","feature_start_date","feature_end_date","bom_sku","payment_method","color_code","tax_rate","tax_price"]

  def self.assign_filename
    current_date = DateTime.now
    self.filename = 'EllieInfluencers' + current_date.strftime("_%^B%Y") + '.csv'
  end

  def create_csv_file(filename)
    @influencers = Influencer.all
    column_header = header_mapping
    CSV.open(filename,'w',:write_headers => true,
    :headers => column_header) do |header|
      column_header = nil
      @BLAH???.each do |influencer|
        data_out = [order.order_number,
          "",
          "",
          "",
          "",
          "",
          influencer.first_name + " " + influencer.last_name,
          influencer.address1,
          influencer.city,
          influencer.state,
          influencer.zip,
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
          ITEMNAME,
          "",
          "",
          "",
          influencer.first_name + " " + influencer.last_name,
          influencer.address1,
          influencer.city,
          influencer.state,
          influencer.zip,
          "US",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          influencer.phone,
          "",
          "",
          "",
          "",
          "",
          SELLPRICE,
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
          ""
        ]
        header << data_out
      end
    end
  end

  def write_data_to_csv(filename)
    @influencers = Influencer.all
    @influencer_orders = InfluencerOrder.all
    File.open(filename,'a+') do |header|
      if header.tell() == 0
      end

    end
  end

  def generate_ticket(records)
    CSV.generate do |csv|
      csv << Ticket.attribute_names
      records.each { |r| csv << r.attributes.values }
    end
  end

end
