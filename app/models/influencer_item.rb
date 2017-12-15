class Monthly_Order < ActiveRecord::Base

  validates :influencer_id, presence:true

  belongs_to :influencer
  # belongs_to :ticket

end
