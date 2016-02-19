class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :path
      t.text :body
      t.integer :created_user_id
      t.integer :updated_user_id
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
