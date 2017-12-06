class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :variant_id
      t.integer :product_id
      t.string :sku
      t.integer :quantity
      t.string :title
      t.integer :order_id
    end
  end
end
