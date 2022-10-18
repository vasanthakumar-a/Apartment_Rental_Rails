class Credit < ApplicationRecord
  belongs_to :user
  belongs_to :owner

  after_validation :pay_for_credit

  private
  def pay_for_credit
  end
end
