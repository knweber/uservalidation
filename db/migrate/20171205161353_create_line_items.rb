class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.boolean :master_product?
      t.string :title
      t.string :type
      t.string :product_id
      t.string :variant_id
      t.string :sku
      t.integer :quantity
      t.decimal :price
      t.integer :order_id, null:false
    end
  end
end
