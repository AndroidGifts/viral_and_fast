class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.integer "post_id"
    	t.integer "editor_id"

    	t.text "content"
    	t.boolean "approved", :default => false

      t.timestamps null: false
    end
    add_index("comments", "post_id")
    add_index("comments", "editor_id")
  end

  def down
  	drop_table :comments
  end
end
