class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.boolean :billing_address, null:false
      t.boolean :shipping_address, null:false
      t.string :recipient_or_billed_name, null:false
      t.string :street, null:false
      t.string :street_2
      t.string :city, null:false
      t.string :state, null:false
      t.string :postal_code, null:false
      t.string :country, null:false

      t.integer :influencer_id, null:false
      t.timestamps
  end
end
