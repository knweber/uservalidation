class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.boolean :leggings
      t.boolean :sports_bra
      t.boolean :sports_jacket
      t.boolean :top
      t.boolean :wrap

      t.integer :influencer_id, null:false
      
    end
  end
end
