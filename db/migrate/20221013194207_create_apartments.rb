class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string "apartment_name"
      t.text "location"
      t.text "description"
      t.integer "deposit"
      t.integer "rent"
      t.float "room_size"
      t.float "review"
      t.integer "bedrooms"
      t.text "tenant"
      t.integer "building_age"
      t.integer "balcony"
      t.text "furnishing_status"
      t.integer "bathrooms"
      t.text "property_type"

      t.boolean "lift"
      t.boolean "wifi"
      t.boolean "ac"
      t.boolean "fire_safety"
      t.boolean "security"
      t.boolean "house_keeping"
      t.boolean "water_supply"
      t.boolean "parking"
      t.boolean "sewage"

      t.timestamps
    end
  end
end
