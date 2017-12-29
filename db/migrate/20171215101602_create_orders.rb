class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :collection_id
      t.string :order_number
      t.boolean :send_receipt, default:true
      t.boolean :send_fulfillment_receipt, default:true

      t.integer :influencer_id
      t.integer :ticket_id

    end
  end
end
