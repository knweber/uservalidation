class CreateInfluencers < ActiveRecord::Migration
  def change
    create_table :influencers do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :address1, null:false
      t.string :address2
      t.string :city, null:false
      t.string :state, null:false
      t.string :zip, null:false
      t.string :email, null:false
      t.string :phone
      t.string :bra_size, null:false
      t.string :top_size, null:false
      t.string :bottom_size, null:false
      t.string :sports_jacket_size, null:false
      t.string :three_item, null:false

      t.index :last_name
      t.index :email
      t.index :three_item
    end
  end
end
