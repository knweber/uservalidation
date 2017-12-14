class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.integer :quantity, null:false
      t.string :sku, null:false
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :product_id
      t.integer :variant_id
      t.integer :order_id, null:false
    end
  end
end
