class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.bigint "owner_id"
      t.bigint "user_id"
      t.bigint "apartment_id"

      t.timestamps
    end
  end
end
