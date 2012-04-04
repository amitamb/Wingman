class CreateWingmanships < ActiveRecord::Migration
  def change
    create_table :wingmanships do |t|
      t.references :person
      t.integer :wingman_id
      
      t.boolean :person_approved, :default => true, :null => false # given only person can send a request to wingman
      t.boolean :wingman_approved, :default => false, :null => false

      t.timestamps
    end

    add_index :wingmanships, :person_id
    add_index :wingmanships, :wingman_id
  end
end
