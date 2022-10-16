class RemoveOwnerColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :apartments, :owner
  end
end
