class ItemProperty < ActiveRecord::Base

  validates :line_item_id, presence: true

  belongs_to :line_item

end
