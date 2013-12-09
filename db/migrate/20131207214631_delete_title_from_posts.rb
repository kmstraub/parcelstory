class DeleteTitleFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :title
  	remove_column :posts, :source
  end
end
