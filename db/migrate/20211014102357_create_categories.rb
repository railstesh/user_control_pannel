class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :primary_category_id
      t.string :primary_category_name
      t.belongs_to :product

      t.timestamps
    end
  end
end
