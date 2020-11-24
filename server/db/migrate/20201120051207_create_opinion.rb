class CreateOpinion < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.integer :project_id
      t.integer :reference_id, null: true
      t.integer :user_id, null: true
      t.integer :liked, default: 0
      t.string :body
      t.integer :opinion_type
      t.timestamps
    end
  end
end
