class AddPostedDate < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :posted_date, :date
  end
end
