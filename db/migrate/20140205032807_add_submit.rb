class AddSubmit < ActiveRecord::Migration
  def change
    add_column :users, :submit, :string
  end
end
