class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :influencer_id
      t.integer :order_id
      t.timestamps
    end
  end
end
