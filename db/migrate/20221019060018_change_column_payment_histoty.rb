class ChangeColumnPaymentHistoty < ActiveRecord::Migration[6.1]
  def change
    rename_column :payment_histories, :increment, :credits_increment
    rename_column :payment_histories, :decrement, :credits_decrement
  end
end
