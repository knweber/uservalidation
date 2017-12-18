class OutputCSV < ActiveRecord::Base

  def self.generate_filename
    
  end

  def generate_file(records)
    CSV.generate do |csv|
      csv << OutputCSV.attribute_names
      records.each { |r| csv << r.attributes.values }
    end
  end

end
