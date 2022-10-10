class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :apartment_name
      t.text :location
      t.text :description
      t.integer :price
      t.float :review
      t.float :room_size
      t.boolean :ac
      t.boolean :tv
      t.boolean :wifi
      t.boolean :cctv
      t.boolean :house_keeping

      t.timestamps
    end
  end
end
