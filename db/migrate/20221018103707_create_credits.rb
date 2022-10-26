class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|

      t.bigint "coin"

      t.timestamps
    end
  end
end
