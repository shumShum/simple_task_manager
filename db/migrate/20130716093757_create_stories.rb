class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
    	t.text :body
    	t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
    add_index :stories, :parent_id
    add_index :stories, :child_id
  end
end
