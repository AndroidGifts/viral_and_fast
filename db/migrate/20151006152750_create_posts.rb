class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
    	t.integer "editor_id"

    	t.text "title"
    	t.string "permalink"
    	t.text "content"
    	t.string "image"
    	t.text "excerpt"
    	t.boolean "visible", :default => true
    	t.string "type"
    	t.integer "likes_count"
    	t.integer "comment_count"

     	t.timestamps null: false
    end
    add_index("posts", "editor_id")
    add_index("posts", "permalink")
  end

  def down
  	drop_table :posts
  end
end
