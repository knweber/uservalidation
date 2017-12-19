class CreateInfluencerOrder < ActiveRecord::Migration
  def change
    create_table :influencer_orders do |t|
      t.string :order_number, :unique => true
      t.boolean :send_receipt
      t.boolean :send_fulfillment_receipt
      t.integer :influencer_id, null:false
    end
  end
end
