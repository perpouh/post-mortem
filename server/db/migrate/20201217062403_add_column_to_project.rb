class AddColumnToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :manager_id, :integer, :default => 0
  end
end
