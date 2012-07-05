class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :content
      t.integer :user_id
      t.integer :followers
      t.integer :brand

      t.timestamps
    end
  end
end
