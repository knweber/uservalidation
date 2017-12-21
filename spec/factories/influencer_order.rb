require 'factory_bot'

FactoryBot.define do
  factory :influencer_order do
    order_number { InfluencerOrder.generate_order_number }
    send_receipt { false }
    send_fulfillment_receipt { false }
    influencer_id { Influencer.all.sample.id }
  end
end
