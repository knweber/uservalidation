class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :price, :precision => 5, :scale => 2
      t.string :email
      t.boolean :send_receipt
      t.boolean :send_fulfillment_receipt
      t.string :note
      t.integer :influencer_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.index :influencer_id
      t.index :send_receipt
      t.index :send_fulfillment_receipt
      t.timestamps
    end
  end
end
