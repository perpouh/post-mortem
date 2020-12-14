class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ticket_count, :integer, :default => 0
    add_column :users, :comment_count, :integer, :default => 0
  end
end
