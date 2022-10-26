class OwnerDetail < ApplicationRecord
  scope :filter_by_apartment_owner, -> (owner_id) { where owner_id: owner_id }
  scope :filter_by_apartment_user, -> (user_id) { where user_id: user_id }
end
