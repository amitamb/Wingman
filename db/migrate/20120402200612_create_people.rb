class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :location
      t.string :short_desc
      t.text :desc
      
      t.references :user

      t.timestamps
    end
  end
end
