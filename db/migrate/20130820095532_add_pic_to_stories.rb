class AddPicToStories < ActiveRecord::Migration
  def change
    add_column :stories, :pic, :string
  end
end
