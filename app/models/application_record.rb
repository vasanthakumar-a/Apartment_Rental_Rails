class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :filter_by_starts_with, -> (location) { where("name like ?", "#{location}%")}

end
