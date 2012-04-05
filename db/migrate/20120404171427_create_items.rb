class CreateItems < ActiveRecord::Migration
  def change

    create_table :items do |t|
      t.string :text
      t.integer :sharer_id

      t.timestamps
    end

    add_index :items, :sharer_id
  end
end
