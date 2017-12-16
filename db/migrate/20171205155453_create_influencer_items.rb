class CreateInfluencerItems < ActiveRecord::Migration
  def change
    create_table :influencer_items do |t|
      t.string :name
      t.string :sku
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :product_id
      t.integer :variant_id
      t.integer :influencer_id
      t.integer :ticket_id
    end
  end
end
