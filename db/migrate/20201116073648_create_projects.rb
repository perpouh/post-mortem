class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repository_url
      t.string :backlog_url, null: true
      t.string :jira_url, null: true
      t.string :confluence_url, null: true
      t.timestamps
    end
  end
end
