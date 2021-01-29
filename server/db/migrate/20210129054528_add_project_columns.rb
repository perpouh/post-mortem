class AddProjectColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :summary, :text
  end
end
