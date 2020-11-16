class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :profile_image, null: true
      t.integer :ticket_count, default: 0
      t.integer :comment_count, default: 0
      
      t.timestamps
    end
  end
end
