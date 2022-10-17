class AddReferencesToApartment < ActiveRecord::Migration[6.1]
  def change
    add_reference :apartments, :owner, index: true
  end
end
