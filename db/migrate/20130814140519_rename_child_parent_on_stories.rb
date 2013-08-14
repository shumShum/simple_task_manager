class RenameChildParentOnStories < ActiveRecord::Migration
  def change
  	rename_column :stories, :child_id, :assignee_id
  	rename_column :stories, :parent_id, :assigner_id
  end
end
