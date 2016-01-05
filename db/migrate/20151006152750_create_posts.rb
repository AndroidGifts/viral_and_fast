class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
    	t.integer "editor_id"

    	t.text "title"
    	t.text "content"
    	t.text "excerpt"
      t.attachment "image"
    	t.boolean "visible", :default => true
    	t.string "post_type"
    	t.integer "likes_count", :default => 0
    	t.integer "comment_count", :default => 0

     	t.timestamps null: false
    end
    add_index("posts", "editor_id")
  end

  def down
  	drop_table :posts
  end
end