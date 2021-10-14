class CreateLeafCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :leaf_categories do |t|
      t.integer :leaf_category_id
      t.string :leaf_category_name
      t.belongs_to :product

      t.timestamps
    end
  end
end
