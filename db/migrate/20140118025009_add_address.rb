class AddAddress < ActiveRecord::Migration
  def change
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
    add_column :users, :address_line3, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
  end
end
