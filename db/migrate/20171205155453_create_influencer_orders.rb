class CreateInfluencerOrders < ActiveRecord::Migration
  def change
    create_table :influencer_orders do |t|
      t.string :order_number
      t.boolean :send_receipt, default:true
      t.boolean :send_fulfillment_receipt, default:true
      t.integer :influencer_id, null:false
      t.integer :ticket_id
    end
  end
end
