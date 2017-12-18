class CreateItemProperties < ActiveRecord::Migration
  def change
    create_table :item_properties do |t|
      t.string :name
      t.string :value
      t.integer :line_item_id
    end
  end
end
