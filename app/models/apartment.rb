class Apartment < ApplicationRecord

  has_many_attached :image
  belongs_to :owner

  validates :apartment_name, presence: :true
  validates :location, presence: :true
  validates :description, presence: :true
  validates :deposit, presence: :true
  validates :rent, presence: :true
  validates :review, presence: :true
  validates :room_size, presence: :true
  validates :tenant, presence: :true
  validates :bedrooms, presence: :true
  validates :bathrooms, presence: :true
  validates :building_age, presence: :true
  validates :balcony, presence: :true
  validates :furnishing_status, presence: :true
  validates :property_type, presence: :true
  validates :posted_date, presence: :true

  scope :filter_by, -> (location) { where("location ilike ?", "%#{location}%")}
  scope :filter_by_search_location, -> (search_location) { where("location ilike ?", "%#{search_location}%")}
  scope :filter_by_owner_id, -> (owner_id) { where owner_id: owner_id }
end
