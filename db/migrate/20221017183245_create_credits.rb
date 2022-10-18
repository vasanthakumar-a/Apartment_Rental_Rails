class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|

      t.bigint :coin
      t.bigint "user_id"
      t.bigint "owner_id"
      t.index ["user_id"], name: "index_credits_on_user_id"
      t.index ["owner_id"], name: "index_credits_on_owner_id"

      t.timestamps
    end
  end
end
