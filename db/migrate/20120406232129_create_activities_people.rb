class CreateActivitiesPeople < ActiveRecord::Migration
  def change
    create_table :activities_people do |t|
      t.references :activity
      t.references :person
    end
    add_index :activities_people, :activity_id
    add_index :activities_people, :person_id
  end
end
