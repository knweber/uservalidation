class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.boolean :three_item
      t.string :order_number
      t.boolean :send_receipt, default:true
      t.boolean :send_fulfillment_receipt, default:true

      t.integer :influencer_id, null:false
      t.integer :ticket_id

      t.boolean :leggings, :default => false
      t.boolean :sports_bra, :default => false
      t.boolean :sports_jacket, :default => false
      t.boolean :top, :default => false
      t.boolean :wrap, :default => false


    end
  end
end
