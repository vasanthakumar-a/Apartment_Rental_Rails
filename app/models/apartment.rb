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
  # validates :image, content_type: ['image/jpg', 'image/png']
  validates :image, attached: true, content_type: [:png, :jpg, :jpeg]

  validates_numericality_of   :bedrooms    
  validates_numericality_of   :bathrooms 
  validates_numericality_of   :balcony 
  validates_numericality_of   :building_age           

  scope :filter_by, -> (location) { where("location ilike ?", "%#{location}%")}  
  scope :filter_by_search_location, -> (search_location) { where("location ilike ?", "%#{search_location}%")}
  scope :filter_by_owner_id, -> (owner_id) { where owner_id: owner_id }
  
  # validate :correct_image_type
  
  # private 
  

  # def correct_image_type
  #   if image.attached? && !image.blob.content_type.in?(%w('image/jpg image/png'))
  #     errors.add(:image, 'needs to be a valid type')
  #   end   
  # end  
end
