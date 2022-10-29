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

  validates_numericality_of   :bedrooms    
  validates_numericality_of   :bathrooms 
  validates_numericality_of   :balcony 
  validates_numericality_of   :building_age       

  scope :filter_by, -> (location) { where("location ilike ?", "%#{location}%")}
  scope :filter_by_search_location, -> (search_location) { where("location ilike ?", "%#{search_location}%")}
  scope :filter_by_owner_id, -> (owner_id) { where owner_id: owner_id }

  # validate :upload_is_image

  # private  

  # def upload_is_image
  #   unless upload and upload.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
  #     errors.add(:upload, "Not a valid image")
  #   end
  # end

  # validate :image_type 

  # private 
  # def image_type
  #    if images_attached? == false 
  #      errors.add(:images, "are missing")
  #    end 

  #    images.each do |image| 
  #     if !image.content_type.in?(%('image/jpg image/png'))
  #       errors.add(:images, 'needs to be a valid type')
  #     end 
  # end  
end
