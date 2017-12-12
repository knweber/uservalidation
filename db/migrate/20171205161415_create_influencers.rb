class CreateInfluencers < ActiveRecord::Migration
  def change
    create_table :influencers do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.string :email, null:false
      t.string :phone, null:false
      t.string :bra_size, null:false
      t.string :top_size, null:false
      t.string :bottom_size, null:false
      t.string :sports_jacket_size, null:false
      t.boolean :three_item, null:false

      t.index :lastname
      t.index :email
      t.index :three_item
    end
  end
end
