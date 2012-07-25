class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|
      t.integer :follower_id
      t.integer :followed_idea_id

      t.timestamps
    end
    add_index :followships, :follower_id
    add_index :followships, :followed_idea_id
    add_index :followships, [:follower_id, :followed_idea_id], unique: true
  end
end
