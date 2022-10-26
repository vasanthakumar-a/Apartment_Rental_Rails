class CreateOwnerDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :owner_details do |t|

      t.bigint "owner_id"
      t.bigint "user_id"
      t.bigint "apartment_owner_id"

      t.timestamps
    end
    add_reference :owner_details, :apartments, index: true, null: true
  end
end
