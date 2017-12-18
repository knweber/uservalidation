class ItemProperty < ActiveRecord::Base
  validates :name
  validates :value
  validates :line_item_id

  belongs to :line_item
end
