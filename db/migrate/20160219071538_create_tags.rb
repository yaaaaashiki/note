class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.integer :created_user_id
      t.integer :updated_user_id
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
