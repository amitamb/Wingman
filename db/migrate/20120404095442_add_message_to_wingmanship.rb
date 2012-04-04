class AddMessageToWingmanship < ActiveRecord::Migration
  def change
    add_column :wingmanships, :message, :string

  end
end
