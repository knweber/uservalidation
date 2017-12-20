class Influencer < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :bra_size, presence: true
  validates :top_size, presence: true
  validates :bottom_size, presence: true
  validates :sports_jacket_size, presence: true
  validates :three_item, presence: true

  has_many :influencer_orders

end
