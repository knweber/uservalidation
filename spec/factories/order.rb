require_relative '../../app/models/order.rb'

FactoryBot.define do
  factory :order do
    send_receipt { true }
    send_fulfillment_receipt { true }
    influencer_id { rand(1..100) }
  end
end
