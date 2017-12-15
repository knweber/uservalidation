class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.boolean :leggings, :default => false
      t.boolean :sports_bra, :default => false
      t.boolean :sports_jacket, :default => false
      t.boolean :top, :default => false
      t.boolean :wrap, :default => false
      t.boolean :three_item, :default => false

      t.integer :ticket_id
      t.integer :influencer_id

    end
  end
end
