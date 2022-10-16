class AddOwnerReferencesToApartment < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :owner, :integer, references: :owners
  end
end
