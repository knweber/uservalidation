class Address < ActiveRecord::Base

  validates :billing_address, presence: true
  validates :shipping_address, presence: true
  validates :recipient_or_billed_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  validates :influencer_id, presence: true

  belongs_to :addressable, :polymorphic => true
  belongs_to :user

end
