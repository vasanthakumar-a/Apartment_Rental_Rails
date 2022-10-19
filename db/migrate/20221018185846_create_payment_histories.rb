class CreatePaymentHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_histories do |t|

      t.text "message"
      t.string "mode"
      t.bigint "increment"
      t.bigint "decrement"
      t.bigint "user_id"
      t.bigint "owner_id"

      t.timestamps
    end
  end
end
