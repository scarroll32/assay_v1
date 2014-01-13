require 'csv'

class Cosmic < ActiveRecord::Base
  self.per_page = 50

  def self.generate_csv(records, fields = [], options = {})
    columns = fields.map(&:to_s)
    CSV.generate(options) do |csv|
      csv << columns
      records.each do |cosmic|
        csv << cosmic.attributes.values_at(*columns)
      end
    end
  end
end
