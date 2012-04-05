class CreateSharages < ActiveRecord::Migration
  def change
    create_table :sharages do |t|
      t.references :person
      t.references :item

      t.timestamps
    end
    add_index :sharages, :person_id
    add_index :sharages, :item_id
  end
end
