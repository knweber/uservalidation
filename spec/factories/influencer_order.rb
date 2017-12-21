require_relative '../../app/models/influencer_order.rb'

FactoryBot.define do
  factory :influencer_order do
    send_receipt { false }
    send_fulfillment_receipt { false }
    influencer_id { rand(1..100) }
  end
end
