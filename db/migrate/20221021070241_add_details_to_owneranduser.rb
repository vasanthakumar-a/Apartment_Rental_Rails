class AddDetailsToOwneranduser < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :name, :string 
    add_column :owners, :phonenumber, :string 
    add_column :users, :name, :string 
    add_column :users, :phonenumber, :string
  end
end