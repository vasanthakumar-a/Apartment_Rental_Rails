class EditReferenceCredit < ActiveRecord::Migration[6.1]
  def change
    change_column :credits, :owner_id, :bigint, null: true
    change_column :credits, :user_id, :bigint, null: true
  end
end
