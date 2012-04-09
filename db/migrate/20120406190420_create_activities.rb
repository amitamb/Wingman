class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :person
      #t.integer :secondary_id
      t.integer :activity_type
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
    add_index :activities, :person_id
    add_index :activities, [ :target_id , :target_type ]
  end
end
