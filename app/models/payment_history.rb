class PaymentHistory < ApplicationRecord

  scope :filter_history_by_owner_id, -> (owner_id) {  where owner_id: owner_id }
  scope :filter_history_by_user_id, -> (user_id) { where user_id: user_id }
end
