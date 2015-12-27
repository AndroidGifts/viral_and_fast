class CreateCategoriesEditorsJoin < ActiveRecord::Migration
  def up
    create_table :categories_editors, :id => false do |t|
    	t.integer "category_id"
    	t.integer "editor_id"
    end
    add_index :categories_editors, ["category_id", "editor_id"]
  end

  def down
  	drop_table :categories_editors
  end
end
