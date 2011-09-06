class IndexPostsPublished < ActiveRecord::Migration
  def up
    add_index :posts, :published
  end

  def down
    remove_index :posts, :published
  end
end
