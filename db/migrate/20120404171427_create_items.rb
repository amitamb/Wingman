class CreateItems < ActiveRecord::Migration
  def change

    create_table :items do |t|
      t.string :text
      t.integer :original_creator_id

      t.timestamps
    end

    add_index :items, :original_creator_id
  end
end
