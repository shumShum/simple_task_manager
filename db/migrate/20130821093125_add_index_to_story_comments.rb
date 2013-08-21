class AddIndexToStoryComments < ActiveRecord::Migration
  def change
    add_index :story_comments, :ancestry
  end
end
