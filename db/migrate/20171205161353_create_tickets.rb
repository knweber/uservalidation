class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :order_number, null:false, unique:true
      t.datetime :time_order_submitted
      t.boolean :processed
      t.boolean :send_receipt
      t.boolean :send_fulfillment_receipt
      t.string :note
    end
  end
end
