class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :product_type
      t.string :variant_id
      t.string :product_id
      t.string :sku
      t.integer :quantity, default:1
      t.decimal :price, precision: 10, scale: 2
      t.string :title
      t.integer :order_id
    end
  end
end
