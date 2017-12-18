class Ticket < ActiveRecord::Base

  has_many :influencer_orders

  def self.filename
    current_date = DateTime.now
    self.filename = 'EllieInfluencers' + current_date.strftime("_%^B%Y") + '.csv'
  end

  def generate_file(records)
    CSV.generate do |csv|
      csv << Ticket.attribute_names
      records.each { |r| csv << r.attributes.values }
    end
  end

end
