class AddReferenceToCredits < ActiveRecord::Migration[6.1]
  def change
    add_reference :credits, :owner, index: true, null: true
    add_reference :credits, :user, index: true, null: true
  end
end
