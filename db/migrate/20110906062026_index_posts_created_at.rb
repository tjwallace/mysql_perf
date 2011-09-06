class IndexPostsCreatedAt < ActiveRecord::Migration
  def up
    add_index :posts, :created_at
  end

  def down
    remove_index :posts, :created_at
  end
end
