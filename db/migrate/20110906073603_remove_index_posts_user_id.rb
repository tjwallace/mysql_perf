class RemoveIndexPostsUserId < ActiveRecord::Migration
  def up
    remove_index :posts, :user_id
  end

  def down
    add_index :posts, :user_id
  end
end
