class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :ticket_id, null: true
      t.integer :comment_id, null: true
      t.timestamps
    end
  end
end
