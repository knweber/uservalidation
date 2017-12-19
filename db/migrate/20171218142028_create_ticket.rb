class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :filename
    end
  end
end
