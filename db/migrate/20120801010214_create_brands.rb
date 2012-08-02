class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    ##TODO: agregar ideas
  end
end
