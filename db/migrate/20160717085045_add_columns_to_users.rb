class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :joinyear, :integer
    add_column :users, :role, :integer
    add_column :users, :status, :integer
    add_column :users, :description, :text
  end
end
