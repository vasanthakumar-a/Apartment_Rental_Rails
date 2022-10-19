class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    drop_table :credits

    create_table :credits do |t|

      t.bigint "coin"

      t.timestamps
    end
  end
end
