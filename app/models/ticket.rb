require 'sinatra'
require 'csv'
require 'date'

class Ticket < ActiveRecord::Base
  has_many :orders

  before_create do
    if filename.nil?
      current_date = DateTime.now
      name = 'EllieInfluencers' + rand(0..100).to_s + current_date.strftime("_%^B%Y")  + '.csv'
      self.filename = name
    end
  end

end
