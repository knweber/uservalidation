require 'date'
require 'csv'
require 'email_validator'

helpers do


# Checks all user info, writes invalid users to
# invalid_emails.txt and creates new influencers in DB for valid users

  def verify_emails(users)
    invalid_users = []

    users.each do |user|
      email = user[7]
      if !EmailValidator.valid?(email) || /gmaill/ =~ email || /example/ =~ email || /.comm/ =~ email

        invalid_users.push("Name: " + user[0] + " " + user[1] + ", Invalid Email: " + user[7] + " \n")

      else

        influencer = Influencer.new(
          first_name: user[0],
          last_name: user[1],
          email: user[7],
          phone: user[8],
          bra_size: user[9],
          top_size: user[10],
          bottom_size: user[11],
          sports_jacket_size: user[12],
          three_item: user[13])

          if three_item.downcase == "yes" || three_item.downcase == "y"
            three_item = true
          else
            three_item = false
          end

        influencer.save!

        puts "influencer created! #{influencer.first_name}, #{influencer.id}, three-item: #{influencer.three_item}"

      end
    end

    # If there are users with invalid information
    if invalid_users.length > 0
      File.open('invalid_emails.txt','a+') do |file|
        file.write(DateTime.now)
        file.write("\n")
        invalid_users.each do |user|
          file.write(user)
          file.write("\n")
        end
      end
    end

  end

  # def output_order_to_csv(records)
  #   CSV.generate do |csv|
  #     csv << ['order_number','groupon_number','order_date','merchant_sku','quantity_requested','shipment_method_requested','shipment_address_name','shipment_address_street','shipment_address_street_2','shipment_address_city','shipment_address_stat','shipment_address_postal_code','shipment_address_country','gift','gift_message','quantity_shipped','shipment_carrier','shipment_method','shipment_tracking_number','ship_date','groupon_sku','custom_field_value','permalink','item_name','vendor_id','salesforce_deal_option_id','groupon_cost','billing_address_name','billing_address_street','billing_address_city','billing_address_stat','billing_address_postal_code','billing_address_country','purchase_order_number','product_weight','product_weight_unit','product_length','product_width','product_height','product_dimension_unit','customer_phone','incoterms','hts_code','3pl_name','3pl_warehouse_location','kitting_details','sell_price','deal_opportunity_id','shipment_strategy','fulfillment_method','country_of_origin','merchant_permalink','feature_start_date','feature_end_date','bom_sku','payment_method','color_code','tax_rate','tax_price']
  #     records.each { |r| csv << r.attributes.values }
  #   end
  #
  #   File.open((DateTime.now).toString(),'a+') do |file|
  #
  #   end
  # end

end
