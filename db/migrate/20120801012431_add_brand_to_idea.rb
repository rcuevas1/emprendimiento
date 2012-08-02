class AddBrandToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :brand_id, :integer
  end
end
