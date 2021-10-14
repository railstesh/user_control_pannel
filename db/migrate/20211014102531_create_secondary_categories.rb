class CreateSecondaryCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :secondary_categories do |t|
      t.integer :secondary_category_id
      t.string :secondary_category_name
      t.belongs_to :product

      t.timestamps
    end
  end
end
