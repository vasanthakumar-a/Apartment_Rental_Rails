class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :filter_by_starts_with, -> (apartment_name) { where("name like ?", "#{apartment_name}%")}

end
