class AddIsSetupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_setup, :boolean, :default => false
  end
end
