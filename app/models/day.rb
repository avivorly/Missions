class Day < ActiveRecord::Base

  validates_uniqueness_of :date

  def self.by_date(date)
    day = find_by_date(date) || create!(:date => Date.today)
  end
end
