class AddCreditsToUserAndOwner < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :credits, :bigint
    add_column :owners, :credits, :bigint
  end
end
