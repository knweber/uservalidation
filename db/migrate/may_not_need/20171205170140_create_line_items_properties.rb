class CreateLineItemsProperties < ActiveRecord::Migration
  def change
    create_table :line_items_properties do |t|
      t.integer :line_item_id
      t.integer :property_id
    end
  end
end
