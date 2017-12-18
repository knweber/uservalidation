class CreateInfluencerOrder < ActiveRecord::Migration
  def change
    create_table :influencer_items do |t|
      t.string :order_number, :unique => true
      t.string :email, null:false
      t.boolean :send_receipt
      t.boolean :send_fulfillment_receipt
      t.string :note
      t.integer :influencer_id, null:false
    end
  end
end
