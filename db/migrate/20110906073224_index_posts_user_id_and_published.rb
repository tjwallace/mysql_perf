class IndexPostsUserIdAndPublished < ActiveRecord::Migration
  def up
    add_index :posts, [:user_id, :published]
  end

  def down
    remove_index :posts, [:user_id, :published]
  end
end
