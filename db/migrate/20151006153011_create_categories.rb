class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
    	t.string "name"
    	t.text "description"
    	t.attachment "image"
    	t.integer "post_count", :default => 0

      t.timestamps null: false
    end
  end

  def down
  	drop_table :categories
  end
end