FactoryBot.define do
  factory :influencer_order do
    send_receipt { false }
    send_fulfillment_receipt { false }
    influencer_id { Influencer.all.sample.id }
  end
end
