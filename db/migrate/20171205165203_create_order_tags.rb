class CreateOrderTags < ActiveRecord::Migration
  def change
    create_table :order_tags do |t|
      t.integer :tag_id
      t.integer :order_id
    end
  end
end
