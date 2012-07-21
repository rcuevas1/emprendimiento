class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :ideas, [:user_id, :created_at]
  end
end
