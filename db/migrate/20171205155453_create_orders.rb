class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :price, :precision => 5, :scale => 2
      t.boolean :processed
      t.boolean :send_receipt
      t.boolean :send_fulfillment_receipt
      t.string :note
      t.datetime :time_order_submitted
      t.integer :ticket_id, null:false
      t.integer :influencer_id, null:false

      t.timestamps
    end
  end
end
