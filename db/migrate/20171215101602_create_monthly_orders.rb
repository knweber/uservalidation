class CreateMonthlyOrders < ActiveRecord::Migration
  def change
    create_table :monthly_orders do |t|

      t.string :name, :null => false
      t.boolean :collection_placeholder, :default => false
      t.boolean :leggings, :default => false
      t.boolean :sports_bra, :default => false
      t.boolean :sports_jacket, :default => false
      t.boolean :top, :default => false
      t.boolean :wrap, :default => false
      t.boolean :three_item, :default => false

    end
  end
end
