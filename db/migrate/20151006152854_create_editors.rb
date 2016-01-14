class CreateEditors < ActiveRecord::Migration
  def up
    create_table :editors do |t|
    	t.string "first_name"
    	t.string "last_name"
      t.attachment "user_avatar"
      t.string "nickname"
    	t.boolean "active_user"

     	t.timestamps null: false
    end
  end

  def down
    drop_table :editors
  end
end
