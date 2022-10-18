class AddDefaultToCredits < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :credits, :bigint, :default => 0
    change_column :owners, :credits, :bigint, :default => 0
  end
end
