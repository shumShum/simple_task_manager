class AddAncestryToComments < ActiveRecord::Migration
  def change
    add_column :story_comments, :ancestry, :string
  end
end
