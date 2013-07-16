class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|

      t.timestamps
    end
  end
end
