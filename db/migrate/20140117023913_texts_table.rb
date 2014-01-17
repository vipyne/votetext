class TextsTable < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :message

      t.timestamps
    end
  end
end
