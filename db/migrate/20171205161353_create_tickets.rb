class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :order_number, null:false, unique:true

      t.timestamps
    end
  end
end
