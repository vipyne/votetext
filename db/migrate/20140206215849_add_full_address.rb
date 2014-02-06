class AddFullAddress < ActiveRecord::Migration
  def change
    add_column :users, :full_address, :string
  end
end
